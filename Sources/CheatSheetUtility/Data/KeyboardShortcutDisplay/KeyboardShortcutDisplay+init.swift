import SwiftUI

public extension KeyboardShortcutDisplay {
	init<S: StringProtocol>(
		_ name: S,
		icon: Image? = nil,
		_ key: KeyEquivalent,
		modifiers: EventModifiers = .command
	) {
		self.init(
			name,
			icon: icon,
			shortcut: KeyboardShortcut(key, modifiers: modifiers)
		)
	}

	@available(tvOS, unavailable)
	@available(watchOS, unavailable)
	init(
		_ name: String,
		icon: Image? = nil,
		_ key: KeyEquivalent,
		modifiers: EventModifiers = .command,
		localization: KeyboardShortcut.Localization
	) {
		self.init(
			name,
			icon: icon,
			shortcut: KeyboardShortcut(key, modifiers: modifiers, localization: localization)
		)
	}

	init<S: StringProtocol>(
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

	init<S: StringProtocol>(
		_ name: S,
		systemImage: String? = nil,
		_ key: KeyEquivalent,
		modifiers: EventModifiers = .command
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
			shortcut: KeyboardShortcut(key, modifiers: modifiers)
		)
	}

	@available(tvOS, unavailable)
	@available(watchOS, unavailable)
	init<S: StringProtocol>(
		_ name: S,
		systemImage: String? = nil,
		_ key: KeyEquivalent,
		modifiers: EventModifiers = .command,
		localization: KeyboardShortcut.Localization
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
			shortcut: KeyboardShortcut(key, modifiers: modifiers, localization: localization)
		)
	}
}
