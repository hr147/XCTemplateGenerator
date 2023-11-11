// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcodeTemplateGenerator",
    platforms: [
        .iOS(.v13),
        .macOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "XcodeTemplateGenerator", targets: ["XcodeTemplateGenerator"])
    ],
    dependencies: [
        .package(path: "../TCAFeature")
    ],
    targets: [
        .target(
            name: "XcodeTemplateGenerator",
            dependencies: [
                .product(name: "Default", package: "TCAFeature"),
                .product(name: "Client", package: "TCAFeature")
            ]
        ),

        // MARK: Plugins

        .plugin(
            name: "TCAFeatureTemplateGenerator",
            capability: .command(
                intent: .custom(verb: "TCAFeature.xctemplate", description: "Generates & Move template into Xcode."),
                permissions: [
                    .writeToPackageDirectory(reason: "This command create & move template to Xcode.")
                ]
            )
        )
    ]
)
