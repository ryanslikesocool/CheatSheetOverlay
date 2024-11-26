import SwiftUI

extension KeyboardShortcut {
	var displayString: String {
		"\(modifiers.displayString) \(key.displayString)"
	}
}
