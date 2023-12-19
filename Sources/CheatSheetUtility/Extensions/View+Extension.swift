import SwiftUI

public extension View {
	func keyboardShortcut(_ keyboardShortcut: KeyboardShortcutDisplay) -> some View {
		self.keyboardShortcut(keyboardShortcut.keyboardShortcut)
	}
}
