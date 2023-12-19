import SwiftUI

public struct KeyboardShortcutDisplay: Sendable {
	public var name: String
	public var icon: Image?
	public var keyboardShortcut: KeyboardShortcut

	public init<S: StringProtocol>(_ title: S, icon: Image? = nil, shortcut keyboardShortcut: KeyboardShortcut) {
		self.name = String(title)
		self.icon = icon
		self.keyboardShortcut = keyboardShortcut
	}
}

// MARK: - Hashable

extension KeyboardShortcutDisplay: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(keyboardShortcut)
	}
}
