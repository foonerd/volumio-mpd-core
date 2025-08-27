# Volumio MPD Core - Custom MPD 0.24.5

## Overview
This project provides a clean, reproducible build environment for Music Player Daemon (MPD) version 0.24.5, tailored for use within Volumio OS based on Debian 12 (Bookworm). It includes:

- Debian-compliant packaging.
- Multi-architecture Docker-based cross-build setup.
- Custom configuration aligned with Volumio architecture.
- Versioning and feature decisions optimized for low-latency audio output environments.

## Improvements
The default MPD version in Debian Bookworm is 0.23.12. This build updates to 0.24.6 to gain:

- Decoder FFmpeg handlers and mpg123 tags fixes.
- WMA support via FFmpeg.
- Improved DSD and channel conversion.
- Stability improvements in SHOUTcast and OSS outputs.
- Modernized JSON handling (nlohmann_json replaces yajl).
- Removed obsolete plugins (e.g., SoundCloud).
- Use libid3tag to parse stream tags

These changes improve format compatibility, system integration, and simplify maintenance in Volumio deployments.

## Repository Structure

```
volumio-mpd-core/
├── build-matrix.sh                 # Top-level script to build all architectures
├── docker/
│   ├── Dockerfile.mpd.armv6
│   ├── Dockerfile.mpd.armhf
│   ├── Dockerfile.mpd.arm64
│   ├── Dockerfile.mpd.amd64
│   └── run-docker-mpd.sh          # Core build logic per-arch
├── package-sources/
│   ├── mpd_0.24.6.orig.tar.xz
│   └── mpd_0.24.6-1volumio1.debian.tar.xz
├── scripts/
│   └── extract.sh                 # Prepares clean build directory
├── out/                           # Output directory for .deb packages
└── README.md                      # This document
```

## Build System

### Supported Architectures
- armv6 (Pi Zero, Pi 1)
- armhf (Pi 2/3)
- arm64 (Pi 3/4/5, Rockchip, etc.)
- amd64 (x86 Volumio images)

### Build Invocation
Run all targets:
```bash
./build-matrix.sh --volumio --verbose
```

Run a specific target:
```bash
./docker/run-docker-mpd.sh mpd armv6 volumio --verbose
```

### Output
Resulting `.deb` files are placed in:
```
out/<arch>/
```
Renamed with Volumio-friendly suffixes:
- `armv6` => `_arm.deb`
- `armhf` => `_armv7.deb`
- `arm64` => `_armv8.deb`
- `amd64` => `_x64.deb`

## Key Configuration Decisions

### Disabled Features
- No installation of systemd service or user units: Volumio manages MPD.
- No manual pages or documentation.

### Enabled Features
- `httpd`, `shout`, and `alsa` outputs enabled.
- Support for cue sheets, CD/ISO parsing.
- Full set of decoders (ffmpeg, flac, wavpack, etc.).
- io_uring enabled for efficient I/O.

### Meson Build Flags
- All `debian/rules` logic retained from Bookworm backport and adjusted for 0.24.5.
- Removed obsolete or deprecated flags: `yajl`, `soundcloud`.

## Cue Sheet Improvements
MPD 0.24.3 introduces improved handling of embedded CUE sheets in remote FLAC files. This enhancement allows:

- Proper parsing of virtual track boundaries.
- Accurate metadata extraction directly from embedded CUE data.

This improves usability in scenarios involving online FLAC radio streams or album rips with integrated CUE structures. For local .cue + .flac or ISO+CUE use cases, behavior remains consistent with previous versions.

## Build Improvements

- Compiler ICE in GCC 12 resolved using `CXXFLAGS=-O1` and `optimize=-lto`.
- Clean reproducible builds via `scripts/extract.sh`.
- Cross-build support for armhf/armv6 uses qemu and `arm32v7` Docker base.
- Log noise suppressed with `-Wno-psabi` where applicable.

## Compatibility
- Fully tested on Volumio Bookworm-based builds.
- Packaged `.deb` files are drop-in replacements for official `mpd`.
- All Volumio backends (UI, ALSA, plugins) remain compatible.

## Licensing
This project rebuilds open-source MPD under GPLv2+. Volumio-specific packaging and scripts are provided under MIT license unless otherwise specified.
