import SwiftUI

@available(macOS, introduced: 13, obsoleted: 14, message: "Apple implemented KeyEquivalent: Equatable in macOS 14")
extension KeyEquivalent: Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.character == rhs.character
	}
}
