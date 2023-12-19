// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CheatSheetUtility",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v13),
		.iOS(.v16),
	],
    products: [
        .library(
            name: "CheatSheetUtility",
            targets: ["CheatSheetUtility"]),
    ],
    targets: [
        .target(
            name: "CheatSheetUtility"
		),
    ]
)
