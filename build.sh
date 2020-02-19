#!/bin/bash

set -xeo pipefail

export ANDROID_HOME=$HOME/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH

sdkmanager 'build-tools;27.0.3' 'platforms;android-27'

./gradlew assembleDebug
./gradlew assembleRelease
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/.android/debug.keystore /home/testu2/k-9-hacked/k9mail/build/outputs/apk/release/k9mail-release-unsigned.apk androiddebugkey -storepass android
