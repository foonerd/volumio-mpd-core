Format: 3.0 (quilt)
Source: mpd
Binary: mpd
Architecture: any
Version: 0.23.15-1
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
 2ba8669bbfd139bcd98908938add2c24225ca78a 1112440 mpd_0.23.15.orig.tar.gz
 09d682ad01fc6f97c4d1de9e508c628dbcc9649d 34816 mpd_0.23.15-1.debian.tar.xz
Checksums-Sha256:
 db646863f251b0652d034f87dbdbe87bba3472db23fcaf5ac90339f8cb3d845c 1112440 mpd_0.23.15.orig.tar.gz
 acfa90d1d95353413fe2d1713718860e835f3dfe06ed2ebbbc30f62eac0b4e9a 34816 mpd_0.23.15-1.debian.tar.xz
Files:
 0f21092a2ef5ca32689244820d0685d4 1112440 mpd_0.23.15.orig.tar.gz
 3ae127f2b67992f003238708c9133457 34816 mpd_0.23.15-1.debian.tar.xz
