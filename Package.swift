// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Quba",
    platforms: [
        .macOS(.v10_11),
    ],
    products: [
        .executable(
            name: "Quba", 
            targets: ["Quba"]),
    ],
    dependencies: [
        .package(url: "https://github.com/muizidn/viewdsl.git", .branch("spm")),
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.1"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.1")
    ],
    targets: [
        .target(
            name: "Quba",
            dependencies: ["QubaUI"]),
        .target(
            name: "QubaUI",
            dependencies: ["ViewDSL", "TinyConstraints", "RxSwift", "RxCocoa"]),
        .testTarget(
            name: "QubaTests",
            dependencies: ["Quba"]),
    ]
)
