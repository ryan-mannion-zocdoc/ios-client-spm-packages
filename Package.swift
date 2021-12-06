// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "AWSCognito", targets: ["AWSCore", "AWSCognitoAuth", "AWSCognitoIdentityProviderASF"]),
    ],
    targets: [
        .binaryTarget(name: "AWSCognitoAuth", path: "AWSCognitoAuth.xcframework"),
        .binaryTarget(name: "AWSCore", path: "AWSCore.xcframework"),
        .binaryTarget(name: "AWSCognitoIdentityProviderASF", path: "AWSCognitoIdentityProviderASF.xcframework"),
    ]
)

