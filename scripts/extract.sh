#!/bin/bash
set -e

# Check if the script is being run from the root of the project
if [[ ! -d "package-sources" ]]; then
  echo "Error: This script should be run from the root of the project directory."
  exit 1
fi

# Set the paths for mpd source and debian tarballs
ORIG_TAR_PATH="package-sources/mpd_0.24.5.orig.tar.xz"
DEBIAN_TAR_PATH="package-sources/mpd_0.24.5-2volumio1.debian.tar.xz"

# Ensure both tarballs exist
if [[ ! -f "$ORIG_TAR_PATH" ]]; then
  echo "Error: $ORIG_TAR_PATH does not exist."
  exit 1
fi

if [[ ! -f "$DEBIAN_TAR_PATH" ]]; then
  echo "Error: $DEBIAN_TAR_PATH does not exist."
  exit 1
fi

# Set the destination for extracted source
DEST_DIR="build/mpd/source"

# Cleanup the destination directory before extraction
echo "[+] Cleaning up destination directory: $DEST_DIR"
rm -rf "$DEST_DIR"
mkdir -p "$DEST_DIR"

# Step 1: Extract the original tarball to the destination directory
echo "[+] Extracting mpd.orig.tar.xz to $DEST_DIR"
tar -xvf "$ORIG_TAR_PATH" -C "$DEST_DIR" --strip-components=1

# Step 2: Create the subdirectory for debian files under the package folder
DEBIAN_DIR="$DEST_DIR/debian"
mkdir -p "$DEBIAN_DIR"

# Step 3: Extract the debian tarball into the debian subfolder
echo "[+] Extracting mpd.debian.tar.xz to $DEBIAN_DIR"
tar -xvf "$DEBIAN_TAR_PATH" -C "$DEBIAN_DIR" --strip-components=1

echo "[✓] MPD sources and debian files are extracted to $DEST_DIR"
