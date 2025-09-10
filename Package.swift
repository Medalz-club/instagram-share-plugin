// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "InstagramSharePlugin",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "InstagramSharePlugin",
            targets: ["InstagramSharePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "InstagramSharePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/InstagramSharePlugin"),
        .testTarget(
            name: "InstagramSharePluginTests",
            dependencies: ["InstagramSharePlugin"],
            path: "ios/Tests/InstagramSharePluginTests")
    ]
)