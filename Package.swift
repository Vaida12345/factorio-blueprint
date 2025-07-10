// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "factorio blueprint",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "factorio blueprint", targets: ["factorio blueprint"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Vaida12345/Essentials", from: "1.0.0"),
        .package(url: "https://github.com/Vaida12345/DetailedDescription", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "factorio blueprint", dependencies: ["Essentials", "DetailedDescription"], path: "Sources"),
        .executableTarget(name: "Client", dependencies: ["factorio blueprint", "DetailedDescription"], path: "Client"),
        .testTarget(name: "Tests", dependencies: ["factorio blueprint"], path: "Tests")
    ]
)
