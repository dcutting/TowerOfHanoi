// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TowerOfHanoi",
    products: [
        .executable(
            name: "TowerOfHanoi",
            targets: [ "TowerOfHanoi" ]),
        .library(
            name: "TowerOfHanoiLib",
            targets: [ "TowerOfHanoiLib" ])
    ],
    targets: [
        .target(
            name: "TowerOfHanoi",
            dependencies: [ "TowerOfHanoiLib" ]),
        .target(
            name: "TowerOfHanoiLib",
            dependencies: []),
        .testTarget(
            name: "TowerOfHanoiTests",
            dependencies: [ "TowerOfHanoiLib" ])
    ]
)
