import SwiftUI

extension EventModifiers {
	func cases() -> [EventModifiers] {
		[
			.control,
			.option,
			.shift,
			.command,
		].filter(contains)
	}

	var displayString: String {
		switch self {
			case .capsLock: ""
			case .control: "⌃"
			case .option: "⌥"
			case .shift: "⇧"
			case .command: "⌘"
			case .numericPad: ""
			default: cases().map(\.displayString).joined(separator: " ")
		}
	}
}
