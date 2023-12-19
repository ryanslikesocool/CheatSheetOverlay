import SwiftUI

/// A group of keyboard shortcuts with an optional name and icon.
public struct KeyboardShortcutGroup {
	public var name: String?
	public var icon: Image?
	public var shortcuts: [KeyboardShortcutDisplay]

	public init<S: Sequence>(_ name: String?, icon: Image? = nil, shortcuts: S) where S.Element == KeyboardShortcutDisplay {
		self.name = name
		self.icon = icon
		self.shortcuts = Array(shortcuts)
	}
}

// MARK: - Hashable

extension KeyboardShortcutGroup: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(shortcuts)
	}
}

// MARK: - ExpressibleByArrayLiteral

extension KeyboardShortcutGroup: ExpressibleByArrayLiteral {
	public init(arrayLiteral elements: KeyboardShortcutDisplay...) {
		self.init(nil, shortcuts: elements)
	}
}
