// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Codec",
    products: [
        .library(name: "Codec", targets: ["Codec"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Codec", dependencies: []),
    ],
    swiftLanguageVersions: [4]
)
