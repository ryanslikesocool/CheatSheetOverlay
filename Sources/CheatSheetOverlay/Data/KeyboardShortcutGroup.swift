import SwiftUI

/// A group of keyboard shortcuts with an optional name and icon.
public struct KeyboardShortcutGroup {
	/// The optional name of the group.
	public var name: String?
	/// The optional icon displayed next to the group name.
	public var icon: Image?
	/// The shortcuts contained in this group
	public var shortcuts: [KeyboardShortcutDisplay]

	public init<S: Sequence>(_ name: String?, icon: Image? = nil, shortcuts: S) where S.Element == KeyboardShortcutDisplay {
		self.name = name
		self.icon = icon
		self.shortcuts = Array(shortcuts)
	}

	public init<S: StringProtocol, Sq: Sequence>(_ name: S?, systemImage: String?, shortcuts: Sq) where Sq.Element == KeyboardShortcutDisplay {
		self.init(
			{
				if let name {
					String(name)
				} else {
					nil
				}
			}(),
			icon: {
				if let systemImage {
					Image(systemName: systemImage)
				} else {
					nil
				}
			}(),
			shortcuts: shortcuts
		)
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
