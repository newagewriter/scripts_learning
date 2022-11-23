#! /usr/bin/env bash

build_tools_version="build-tools;33.0.0"
platform_version="platforms;android-32"
system_image="system-images;android-32;google_apis;x86_64"

echo "Setup env"

cat /etc/lsb-release

apt-get -y update

apt-get install -y openjdk-8-jdk wget unzip

apt-get install -y libgl1-mesa-dev

wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip

unzip commandlinetools-linux-8512546_latest.zip

mkdir /usr/lib/android-sdk/

mkdir /usr/lib/android-sdk/cmdline-tools

mv cmdline-tools /usr/lib/android-sdk/cmdline-tools/latest

export ANDROID_SDK_ROOT=/usr/lib/android-sdk

export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"

sdkmanager --list

yes | sdkmanager --licenses

yes | sdkmanager "platform-tools" "$build_tools_version"

yes | sdkmanager "platform-tools" "$platform_version"

yes | sdkmanager "platform-tools" "emulator"

yes | sdkmanager "$system_image"

export PATH="$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platofrm-tools"
