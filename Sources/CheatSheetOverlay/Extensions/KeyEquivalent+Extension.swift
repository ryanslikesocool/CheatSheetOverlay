import SwiftUI

@available(macOS, introduced: 13, obsoleted: 14, message: "Apple implemented KeyEquivalent: Equatable in macOS 14")
extension KeyEquivalent: @retroactive Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.character == rhs.character
	}
}

extension KeyEquivalent {
	var displayString: String {
		switch self {
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
			default: character.uppercased()
		}
	}
}