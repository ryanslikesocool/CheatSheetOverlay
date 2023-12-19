import SwiftUI

extension KeyboardShortcut {
	var displayString: String {
		[
			modifiers.displayString,
			{
				switch key {
					case .upArrow: "↑"
					case .downArrow: "↓"
					case .leftArrow: "←"
					case .rightArrow: "→"
					case .escape: "⎋"
					case .delete: "⌫"
					case .deleteForward: "⌦"
					case .home: "⇱"
					case .end: "⇲"
					case .pageUp: "PgUp"
					case .pageDown: "PgDn"
					case .clear: "⌧"
					case .tab: "⇥"
					case .space: "⎵"
					case .return: "↩"
					default: key.character.uppercased()
				}
			}(),
		].joined(separator: " ")
	}
}
