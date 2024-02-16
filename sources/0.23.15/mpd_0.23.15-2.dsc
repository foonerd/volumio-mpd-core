Format: 3.0 (quilt)
Source: mpd
Binary: mpd
Architecture: any
Version: 0.23.15-2
Maintainer: mpd maintainers <pkg-mpd-maintainers@lists.alioth.debian.org>
Uploaders: Florian Schlichting <fsfs@debian.org>, Geoffroy Youri Berret <kaliko@debian.org>
Homepage: https://www.musicpd.org/
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/mpd-team/mpd
Vcs-Git: https://salsa.debian.org/mpd-team/mpd.git
Testsuite: autopkgtest
Testsuite-Triggers: libaudio-mpd-perl, libtest-corpus-audio-mpd-perl, net-tools
Build-Depends: debhelper-compat (= 13), meson (>= 0.56.0), libsndio-dev, libadplug-dev, libao-dev, libasound2-dev [linux-any], libavahi-client-dev, libavcodec-dev, libavfilter-dev, libavformat-dev, libboost-dev, libbz2-dev, libcdio-paranoia-dev (>= 10.2+0.93+1), libchromaprint-dev, libcurl4-gnutls-dev (>= 7.55), libexpat1-dev, libfaad-dev, libflac-dev, libfluidsynth-dev, libfmt-dev (>= 5.1.2), libgcrypt20-dev, libgme-dev, libicu-dev, libid3tag0-dev, libiso9660-dev, libjack-jackd2-dev, libmad0-dev, libmikmod-dev, libmms-dev, libmodplug-dev, libmp3lame-dev, libmpcdec-dev, libmpdclient-dev (>= 2.11), libmpg123-dev, libnfs-dev, libogg-dev, libopenal-dev, libopenmpt-dev, libopus-dev, libpcre2-dev, libpipewire-0.2-dev, libpulse-dev, libresid-builder-dev, libsamplerate0-dev, libshine-dev [armel], libshout-dev, libsidplayfp-dev, libsidutils-dev, libsmbclient-dev [!hurd-i386], libsndfile1-dev, libsoxr-dev, libsqlite3-dev, libsystemd-dev [linux-any], libupnp-dev (>= 1.8~), libvorbis-dev [!armel], libvorbisidec-dev (>= 1.2.1+git20180316-3) [armel], libwavpack-dev, libwildmidi-dev, libyajl-dev, libzzip-dev, python3-sphinx, libgtest-dev
Package-List:
 mpd deb sound optional arch=any
Checksums-Sha1:
 6e1792c60e6683e4640e584b79adf6126b0a1203 1111836 mpd_0.23.15.orig.tar.gz
 9d7d2f99c9fce6c1f48b438b88609d7b31e7fddb 34972 mpd_0.23.15-2.debian.tar.xz
Checksums-Sha256:
 6349a53703b3d666c382563cc060c150744007cb88bca17214383ea3aa827b66 1111836 mpd_0.23.15.orig.tar.gz
 cc28b53caf7ade6e87cade2bf4fb6f0a0a28ca82312fa4f40f2b5887c1dfc1ef 34972 mpd_0.23.15-2.debian.tar.xz
Files:
 af992a696ab76b6255ff87ee8001c51b 1111836 mpd_0.23.15.orig.tar.gz
 49116db799522a8630350b8c45a2988a 34972 mpd_0.23.15-2.debian.tar.xz
