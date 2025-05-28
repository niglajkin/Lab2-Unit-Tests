// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Lab2-Unit-Tests",
    products: [
        .executable(
            name: "Lab2-Unit-Tests",
            targets: ["Lab2-Unit-Tests"]
        ),
        .library(
            name: "CustomListCore",
            targets: ["CustomListCore"]
        ),
    ],
    targets: [
        .target(
            name: "CustomListCore",
            path: "Sources/CustomListCore"
        ),
        .executableTarget(
            name: "Lab2-Unit-Tests",
            dependencies: ["CustomListCore"],
            path: "Sources",
            exclude: ["CustomListCore"]         
        ),
        .testTarget(
            name: "CustomListTests",
            dependencies: ["CustomListCore"]
        ),
    ]
)