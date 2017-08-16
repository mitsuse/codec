// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Codec",
    products: [
        .library(name: "Codec", targets: ["Codec"]),
    ],
    dependencies: [
        .package(url: "https://github.com/antitypical/Result", .upToNextMinor(from: "3.2.0")),
    ],
    targets: [
        .target(name: "Codec", dependencies: ["Result"]),
    ],
    swiftLanguageVersions: [4]
)
