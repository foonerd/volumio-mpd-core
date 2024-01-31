# mpd

Music Player Daemon (MPD) is a flexible, powerful, server-side application for playing music. Through plugins and libraries it can play a variety of sound files while being controlled by its network protocol.A minimalist command line interface to MPD.

This repo is intended for [Volumio music player](https://volumio.com/) MPD enhancements for armfh.

### Contents


| Folder           | Content                                              |
| ------------------ | ------------------------------------------------------ |
| /packages/static | Compiled and ready to use packages for Volumio3.     |
| /packages/debug  | The usual – extra debug packages for curious minds. |
| /sources         | Complete sources for this build.                     |

## Build notes

This is not a complete guide, only set of essential instructions for this build:

### Update repos:

**sudo nano /etc/apt/sources.list**

```
deb-src http://raspbian.raspberrypi.org/raspbian/ buster main contrib non-free rpi
deb http://ftp.uk.debian.org/debian buster-backports main
```

sudo apt update

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131

sudo apt update

### Install essential build packages:

sudo apt-get install build-essential fakeroot devscripts

### Install build required packages:

sudo apt install libsndio-dev libopenmpt-dev libpcre2-dev libpipewire-0.2-dev

### Install backport packages:

sudo apt install -t buster-backports libfmt-dev liburing-dev libsystemd-dev liburing1

### Install mpd dependencies:

sudo apt build-dep mpd

### Run build:

debuild -b -uc -us

*or complete with sources*

debuild -uc -us

---

### Package installation:

The mpd_0.23.1x-1_armhf.deb packages relies on `liburing1` and as such is an installation prerequisite. Two options for your choosing:

#### Install from backports

sudo apt install -t buster-backports liburing1

#### Download from this [repo /packages/static](https://github.com/foonerd/volumio3-mpd/blob/main/packages/static/liburing1_0.7-3~bpo10%2B1_armhf.deb "liburing1_0.7-3~bpo10+1_armhf.deb") and install

sudo apt install ./liburing1_0.7-3~bpo10+1_armhf.deb

---
