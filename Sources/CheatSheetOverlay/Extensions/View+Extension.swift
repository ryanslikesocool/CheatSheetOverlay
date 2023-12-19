import SwiftUI

public extension View {
	/// A convenience modifier that applies the underlying `keyboardShortcut` of ``KeyboardShortcutDisplay`` to a view.
	func keyboardShortcut(_ keyboardShortcut: KeyboardShortcutDisplay) -> some View {
		self.keyboardShortcut(keyboardShortcut.keyboardShortcut)
	}
}
