# What is this

This is our own repository of Swift Package Manager definitions for 3rd-party dependencies that don't maintain their own SPM Package files or for our own forks.

## Building the AWS SDK

* Clone https://github.com/ryan-mannion-zocdoc/aws-sdk-ios
* From the working directory of the cloned `aws-sdk-ios` repository, run: `../ios-client-spm-packages/build.sh` (replace `ios-client-spm-packages` as appropriate if you've cloned _this_ repo to a different directory)
* On success, the build script will emit `.xcframework`s into an `xcframework` directory. Move them one level up and commit/push them.

