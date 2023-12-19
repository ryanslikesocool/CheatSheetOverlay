import SwiftUI

extension EventModifiers {
	func cases() -> [EventModifiers] {
		Self.allCases.filter(contains)
	}
}

extension EventModifiers: CaseIterable {
	public static var allCases: [EventModifiers] = [
		.control,
		.option,
		.shift,
		.command,
	]
}

extension EventModifiers: CustomStringConvertible {
	public var description: String {
		switch self {
			case .capsLock: ""
			case .control: "⌃"
			case .option: "⌥"
			case .shift: "⇧"
			case .command: "⌘"
			case .numericPad: ""
			default: cases().map(\.description).joined(separator: " ")
		}
	}
}
