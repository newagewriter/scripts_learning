#! /usr/bin/env bash

export ANDROID_SDK_ROOT=/usr/lib/android-sdk

export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platofrm-tools"

device_name="testAVD"
device_port="5554"
system_image="system-images;android-32;google_apis;x86_64"
system_image_arm="system-images;android-32;google_apis_playstore;arm64-v8a"

avdmanager create avd --force --name $device_name --package "$system_image" -d pixel

emulator -avd $device_name -port $device_port -netdelay none -netspeed full -no-window &

avdmanager delete avd -n testAVD