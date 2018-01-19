#!/bin/sh

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
XCODEPROJ="${CURRENT_DIR}/Pareizrakstiba-10.7+-Xcode_7.3_on_10.11.xcodeproj"

# old xcodebuild expects relative path to the project. facepalm.
#xcodebuild -version
#Xcode 3.1.4
#Component versions: DevToolsCore-1204.0; DevToolsSupport-1186.0
#BuildVersion: 9M2809

#cd "$( dirname "${BASH_SOURCE[0]}" )"
#XCODEPROJ="Pareizrakstiba-10.6-Xcode_3.2.6_on_10.6.xcodeproj"

xcrun xcodebuild -project "${XCODEPROJ}" -target Pareizrakstiba-10.7+ -sdk macosx10.11 -configuration Debug clean build $@

