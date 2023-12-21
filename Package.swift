// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CheatSheetOverlay",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v13),
	],
    products: [
        .library(
            name: "CheatSheetOverlay",
            targets: ["CheatSheetOverlay"]),
    ],
    targets: [
        .target(
            name: "CheatSheetOverlay"
		),
    ]
)
