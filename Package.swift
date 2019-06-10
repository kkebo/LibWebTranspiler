// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "LibWebTranspiler",
    products: [
        .library(
            name: "LibWebTranspiler",
            targets: ["LibWebTranspiler"]),
        .library(
            name: "libsass",
            targets: ["libsass"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LibWebTranspiler",
            dependencies: ["libsass"]),
        .target(
            name: "libsass",
            sources: ["src"],
            publicHeadersPath: "include"),
        .testTarget(
            name: "LibWebTranspilerTests",
            dependencies: ["LibWebTranspiler"]),
    ],
    cxxLanguageStandard: CXXLanguageStandard.cxx14
)
