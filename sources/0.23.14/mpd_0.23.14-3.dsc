Format: 3.0 (quilt)
Source: mpd
Binary: mpd
Architecture: any
Version: 0.23.14-3
Maintainer: mpd maintainers <pkg-mpd-maintainers@lists.alioth.debian.org>
Uploaders: Florian Schlichting <fsfs@debian.org>, Geoffroy Youri Berret <kaliko@debian.org>
Homepage: https://www.musicpd.org/
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/mpd-team/mpd
Vcs-Git: https://salsa.debian.org/mpd-team/mpd.git
Testsuite: autopkgtest
Testsuite-Triggers: libaudio-mpd-perl, libtest-corpus-audio-mpd-perl, net-tools
Build-Depends: debhelper-compat (= 13), meson (>= 0.56.0), libsndio-dev, libadplug-dev, libao-dev, libasound2-dev [linux-any], libavahi-client-dev, libavcodec-dev, libavformat-dev, libboost-dev, libbz2-dev, libcdio-paranoia-dev (>= 10.2+0.93+1), libchromaprint-dev, libcurl4-gnutls-dev (>= 7.55), libexpat1-dev, libfaad-dev, libflac-dev, libfluidsynth-dev, libfmt-dev (>= 6.1.2), libgcrypt20-dev, libgme-dev, libicu-dev, libid3tag0-dev, libiso9660-dev, libjack-jackd2-dev, libmad0-dev, libmikmod-dev, libmms-dev, libmodplug-dev, libmp3lame-dev, libmpcdec-dev, libmpdclient-dev (>= 2.11), libmpg123-dev, libnfs-dev, libogg-dev, libopenal-dev, libopenmpt-dev, libopus-dev, libpcre2-dev, libpipewire-0.2-dev, libpulse-dev, libresid-builder-dev, libsamplerate0-dev, libshine-dev [armel], libshout-dev, libsidplayfp-dev, libsidutils-dev, libsmbclient-dev [!hurd-i386], libsndfile1-dev, libsoxr-dev, libsqlite3-dev, libsystemd-dev [linux-any], libupnp-dev (>= 1.8~), liburing-dev [linux-any], libvorbis-dev [!armel], libvorbisidec-dev (>= 1.2.1+git20180316-3) [armel], libwavpack-dev, libwildmidi-dev, libyajl-dev, libzzip-dev, python3-sphinx, libgtest-dev
Package-List:
 mpd deb sound optional arch=any
Checksums-Sha1:
 8c3ffb287969b526ec1d31f9ad0591506ba8ce11 1112212 mpd_0.23.14.orig.tar.gz
 35c5ed82504d4fc020f2d884d6351892ae42af87 35144 mpd_0.23.14-3.debian.tar.xz
Checksums-Sha256:
 7c1e2b2beda47fd4700ea0bcef11b568afbff14ac47edf592339c11c868738ab 1112212 mpd_0.23.14.orig.tar.gz
 1bc9b3e747bf29e1f0f585284180aa843895a9010d19bae28ecdd1f04694acde 35144 mpd_0.23.14-3.debian.tar.xz
Files:
 94dfc66a00bd4b8878aba93904084b29 1112212 mpd_0.23.14.orig.tar.gz
 d38244fa9998005c8f449cb9af0e39e3 35144 mpd_0.23.14-3.debian.tar.xz
