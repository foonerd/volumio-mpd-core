#!/bin/bash
set -e

VERBOSE=0
if [[ "$4" == "--verbose" ]]; then
  VERBOSE=1
fi

COMPONENT=$1
ARCH=$2
MODE=$3  # optional: 'volumio'

# Check if component and architecture are provided
if [[ -z "$COMPONENT" || -z "$ARCH" ]]; then
  echo "Usage: $0 <component> <arch> [volumio] [--verbose]"
  echo "Example: $0 mpd armhf"
  echo "Example: $0 mpd armhf volumio --verbose"
  exit 1
fi

DOCKERFILE="docker/Dockerfile.mpd.$ARCH"
IMAGE_TAG="volumio-mpd-build-$ARCH"

# Available architectures and corresponding build flags
declare -A ARCH_FLAGS
ARCH_FLAGS=(
  ["armv6"]="linux/arm/v7 --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf"
  ["armhf"]="linux/arm/v7 --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf"
  ["arm64"]="linux/arm64 --build=aarch64-linux-gnu --host=aarch64-linux-gnu"
  ["amd64"]="linux/amd64 --build=x86_64-linux-gnu --host=x86_64-linux-gnu"
)

# Check if the architecture is valid
if [[ -z "${ARCH_FLAGS[$ARCH]}" ]]; then
  echo "Error: Unknown architecture: $ARCH"
  echo "Available architectures: ${!ARCH_FLAGS[@]}"
  echo "Build targets: mpd"
  echo "Verbosity: --verbose"
  exit 1
fi

PLATFORM="${ARCH_FLAGS[$ARCH]%% *}"  # Extract platform
BUILD_HOST_FLAGS="${ARCH_FLAGS[$ARCH]#* }"  # Extract flags

# Check if Dockerfile for the architecture exists
if [[ ! -f "$DOCKERFILE" ]]; then
  echo "Missing Dockerfile for architecture: $ARCH"
  exit 1
fi

# Build the image with correct platform and verbosity
echo "[+] Building Docker image for $ARCH ($PLATFORM)..."
if [[ "$VERBOSE" -eq 1 ]]; then
  DOCKER_BUILDKIT=1 docker build --platform=$PLATFORM --progress=plain -t $IMAGE_TAG -f $DOCKERFILE .
else
  docker build --platform=$PLATFORM --progress=auto -t $IMAGE_TAG -f $DOCKERFILE .
fi

# Run the container
echo "[+] Running build for $COMPONENT in Docker ($ARCH)..."
if [[ "$ARCH" == "armv6" ]]; then
  docker run --rm --platform=$PLATFORM -v "$PWD":/build -w /build $IMAGE_TAG bash -c "\
    cd build/$COMPONENT/source && \
    export CFLAGS='-O2 -march=armv6 -mfpu=vfp -mfloat-abi=hard -marm' && \
    export CXXFLAGS='-O1 -Wno-psabi' && \
    export DEB_BUILD_MAINT_OPTIONS='hardening=+all optimize=-lto' && \
    dpkg-buildpackage -us -uc -b"
else
  docker run --rm --platform=$PLATFORM -v "$PWD":/build -w /build $IMAGE_TAG bash -c "\
    cd build/$COMPONENT/source && \
    export CXXFLAGS='-O1 -Wno-psabi' && \
    export DEB_BUILD_MAINT_OPTIONS='hardening=+all optimize=-lto' && \
    dpkg-buildpackage -us -uc -b"
fi

# Move built packages to out/<arch>/
mkdir -p out/$ARCH
find build/$COMPONENT -maxdepth 1 -type f -name '*.deb' -exec mv {} out/$ARCH/ \;

# Rename according to Volumio naming convention if requested
if [[ "$MODE" == "volumio" ]]; then
  echo "[+] Volumio mode: Renaming .deb packages for custom suffixes..."
  for f in out/$ARCH/*.deb; do
    # Skip _all.deb files
    if [[ "$f" == *_all.deb ]]; then
      echo "[VERBOSE] Skipping _all.deb file: $f"
      continue
    fi

    # Extract the base name and current suffix
    base_name=$(basename "$f")
    newf="$f"  # Default to no change

    case "$ARCH" in
      armv6)   
        newf="${f/_armhf.deb/_arm.deb}" 
        if [[ "$f" != "$newf" ]]; then
          echo "[VERBOSE] Renaming $f to $newf (ARMv6/7 target VFP2 - hard-float)"
        fi
        ;;
      armhf)   
        newf="${f/_armhf.deb/_armv7.deb}" 
        if [[ "$f" != "$newf" ]]; then
          echo "[VERBOSE] Renaming $f to $newf (ARMv7 target)"
        fi
        ;;
      arm64)   
        newf="${f/_arm64.deb/_armv8.deb}" 
        if [[ "$f" != "$newf" ]]; then
          echo "[VERBOSE] Renaming $f to $newf (ARMv8 target - 64-bit)"
        fi
        ;;
      amd64)   
        newf="${f/_amd64.deb/_x64.deb}" 
        if [[ "$f" != "$newf" ]]; then
          echo "[VERBOSE] Renaming $f to $newf (x86_64 target)"
        fi
        ;;
      *)       
        newf="$f"
        if [[ "$f" != "$newf" ]]; then
          echo "[VERBOSE] No renaming required for $f"
        fi
        ;;
    esac

    # Only move if the filename actually changed
    if [[ "$f" != "$newf" ]]; then
      mv "$f" "$newf"
    fi
  done
fi

echo "[OK] Build complete. Packages are in out/$ARCH/"
