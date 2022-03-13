// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovieList",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MovieList",
            targets: ["MovieList"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MovieList",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "Tests",
            dependencies: ["MovieList"],
            path: "Tests"
        ),
    ]
)
