import SwiftUI

/// A display for a keyboard shortcut, including a name and optional icon.
public struct KeyboardShortcutDisplay: Sendable {
	/// The name of the action executed by the shortcut.
	public var name: String
	/// An optional icon to be displayed next to the shortcut name.
	public var icon: Image?
	/// The keyboard shortcut.
	public var keyboardShortcut: KeyboardShortcut

	public init<S: StringProtocol>(_ title: S, icon: Image? = nil, shortcut keyboardShortcut: KeyboardShortcut) {
		name = String(title)
		self.icon = icon
		self.keyboardShortcut = keyboardShortcut
	}

	public init<S: StringProtocol>(
		_ name: S,
		systemImage: String? = nil,
		shortcut keyboardShortcut: KeyboardShortcut
	) {
		self.init(
			name,
			icon: {
				if let systemImage {
					Image(systemName: systemImage)
				} else {
					nil
				}
			}(),
			shortcut: keyboardShortcut
		)
	}
}

// MARK: - Hashable

extension KeyboardShortcutDisplay: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(keyboardShortcut)
	}
}
