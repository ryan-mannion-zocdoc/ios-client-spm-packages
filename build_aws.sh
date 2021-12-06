#!/usr/bin/env bash
set -e

# Run this script from within cloned aws-sdk-ios folder, e.g.
# ../ios-client-spm-packages/build_aws.sh

WORKING_DIR="../ios-client-spm-packages"

declare -a SCHEMES=("AWSCore" "AWSCognitoAuth" "AWSCognitoIdentityProviderASF")

for SCHEME in "${SCHEMES[@]}"
do
  X86_SIM_ARCHIVE_PATH="${WORKING_DIR}/archive/${SCHEME}/x86sim.xcarchive"
  xcodebuild archive \
    ONLY_ACTIVE_ARCH=NO \
    -scheme ${SCHEME} \
    -arch x86_64 \
    -archivePath "${X86_SIM_ARCHIVE_PATH}" \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

  ARM_SIM_ARCHIVE_PATH="${WORKING_DIR}/archive/${SCHEME}/armsim.xcarchive"
  xcodebuild archive \
    ONLY_ACTIVE_ARCH=NO \
    -scheme ${SCHEME} \
    -arch arm64 \
    -archivePath "${ARM_SIM_ARCHIVE_PATH}" \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

  ARM_ARCHIVE_PATH="${WORKING_DIR}/archive/${SCHEME}/arm.xcarchive"
  xcodebuild archive \
    -scheme ${SCHEME} \
    -arch arm64 \
    -archivePath "${ARM_ARCHIVE_PATH}" \
    -sdk iphoneos \
    SKIP_INSTALL=NO \
    BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

  lipo "${ARM_SIM_ARCHIVE_PATH}/Products/Library/Frameworks/${SCHEME}.framework/${SCHEME}" \
    "${X86_SIM_ARCHIVE_PATH}/Products/Library/Frameworks/${SCHEME}.framework/${SCHEME}" \
    -create -output "${ARM_SIM_ARCHIVE_PATH}/Products/Library/Frameworks/${SCHEME}.framework/${SCHEME}"

  xcodebuild -create-xcframework \
    -framework ${ARM_SIM_ARCHIVE_PATH}/Products/Library/Frameworks/${SCHEME}.framework \
    -framework ${ARM_ARCHIVE_PATH}/Products/Library/Frameworks/${SCHEME}.framework \
    -output "${WORKING_DIR}/xcframework/${SCHEME}.xcframework"
done

