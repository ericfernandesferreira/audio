#!/bin/sh

# Copyright 2012, 2015  Patrick J. Volkerding, Sebeka, Minnesota, USA
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Modified again by Eric Fernandes Ferreira <candelabrus@gmail.com> for my personal Audio Project

# Set to 1 if you'd like to install/upgrade package as they are built.
# This is recommended.
INST=1
TMP=${TMP:-/tmp}

# This is the original directory where you started this script
AUDIOROOT=$(pwd)
for dir in \
  ladspa \
  soxr \
  webrtc \
  libfdk-aac \
  pulseaudio \
  portaudio \
  fluidsynth \
  libmp4v2 \
  faac \
  faad2 \
  twolame \
  x264 \
  x265 \
  xvidcore \
  libmodplug \
  openal-soft \
  gsm \
  libbs2b \
  libgme \
  nvidia-sdk \
  nv-codec-headers \
  libjxl \
  svt-av1 \
  libmysofa \
  ffmpeg-nvidia \
  libde265 \
  libdv \
  liblc3 \
  libyuv \
  libcamera \
  libldac \
  libfreeaptx \
  pipewire \
  gst-plugins-good \
  ; do
  # Get the package name
  package=$(echo $dir | cut -f2- -d /)

  # Change to package directory
  cd $AUDIOROOT/$dir || exit 1

  # Get the version
  version=$(cat ${package}.SlackBuild | grep "VERSION:" | head -n1 | cut -d "-" -f2 | rev | cut -c 2- | rev)

  # Get the build
  build=$(cat ${package}.SlackBuild | grep "BUILD:" | cut -d "-" -f2 | rev | cut -c 2- | rev)

  # The real build starts here
  sh ${package}.SlackBuild || exit 1
  if [ "$INST" = "1" ]; then
    PACKAGE=`ls $TMP/${package}-${version}-*-${build}*.tgz`
    if [ -f "$PACKAGE" ]; then
      upgradepkg --install-new --reinstall "$PACKAGE"
    else
      echo "Error:  package to upgrade "$PACKAGE" not found in $TMP"
      exit 1
    fi
  fi
  # back to original directory
  cd $AUDIOROOT
done
