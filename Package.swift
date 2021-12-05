// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "AWSCognitoAuth", targets: ["AWSCognitoAuth"]),
        .library(name: "AWSCore", targets: ["AWSCore"]),
        .library(name: "AWSCognitoIdentityProviderASF", targets: ["AWSCognitoIdentityProviderASF"]),
        .library(name: "MarketingCloudSDK", targets: ["MarketingCloudSDK"]),
    ],
    targets: [
        .binaryTarget(name: "AWSCognitoAuth", path: "AWSCognitoAuth.xcframework"),
        .binaryTarget(name: "AWSCore", path: "AWSCore.xcframework"),
        .binaryTarget(name: "AWSCognitoIdentityProviderASF", path: "AWSCognitoIdentityProviderASF.xcframework"),
        .binaryTarget(name: "MarketingCloudSDK", path: "MarketingCloudSDK/MarketingCloudSDK.xcframework"),
    ]
)

