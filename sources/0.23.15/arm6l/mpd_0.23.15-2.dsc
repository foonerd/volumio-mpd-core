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
 fae2ceed362e68a4cfb679e4b3601303473dbfc9 1113559 mpd_0.23.15.orig.tar.gz
 db9bbbd8474e3b1155d8f8cfa654266bff58eeec 34976 mpd_0.23.15-2.debian.tar.xz
Checksums-Sha256:
 404ab048ae2037f9a5cba57e690fe40b3eed20c00d8fc89c7c11594b79cafc86 1113559 mpd_0.23.15.orig.tar.gz
 5baf389c40b4de17e45be004a816cd0e79c5f0bb86518f76834079ca1c123b40 34976 mpd_0.23.15-2.debian.tar.xz
Files:
 f40cc42f5bcc0a45c94232f4111002b4 1113559 mpd_0.23.15.orig.tar.gz
 495e7410b192dc10079a1c87f7732607 34976 mpd_0.23.15-2.debian.tar.xz
