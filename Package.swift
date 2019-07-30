// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Quba",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .executable(
            name: "Quba",
            targets: ["Quba"]),
    ],
    dependencies: [
        .package(url: "https://github.com/muizidn/viewdsl.git", .branch("spm")),
        // Can we use other Layout Engine? YogaSwift?
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.1"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.1"),
        .package(url: "https://github.com/pmacro/LanguageClient", .branch("master")),
        .package(url: "https://github.com/ra1028/DifferenceKit.git", from: "1.1.3"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.2"),
        .package(url: "https://github.com/Quick/Quick.git", from: "2.1.0"),
    ],
    targets: [
        .target(
            name: "Quba",
            dependencies: ["QubaUI"]),
        .target(
            name: "QubaUI",
            dependencies: ["ViewDSL",
                           "TinyConstraints",
                           "RxSwift",
                           "RxCocoa",
                           "LanguageClient",
                           "Logging", ]),
        .target(
            name: "LSP",
            dependencies: ["LanguageClient", "RxSwift"]),
        .testTarget(
            name: "QubaTests",
            dependencies: ["Quba", "Quick", "Nimble"]),
        .testTarget(
            name: "QubaUITests",
            dependencies: ["QubaUI", "Quick", "Nimble"]),
    ]
)
