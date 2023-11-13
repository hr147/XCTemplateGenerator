// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "DefaultFeature", targets: ["DefaultFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.3.0")
    ],
    targets: [
        
        .target(
            name: "DefaultFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
    ]
)
