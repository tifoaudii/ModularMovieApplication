// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovieList",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MovieList",
            targets: ["MovieList"]),
    ],
    dependencies: [
        .package(name: "ImageFetcher" ,path: "../ImageFetcher")
    ],
    targets: [
        .target(
            name: "MovieList",
            dependencies: ["ImageFetcher"],
            path: "Sources"
        ),
        .testTarget(
            name: "Tests",
            dependencies: ["MovieList"],
            path: "Tests"
        ),
    ]
)
