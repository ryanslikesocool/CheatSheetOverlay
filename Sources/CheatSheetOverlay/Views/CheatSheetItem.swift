import SwiftUI

/// A single item on the cheat sheet, including the name, keyboard shortcut, and optional icon.
struct CheatSheetItem: View {
	let shortcut: KeyboardShortcutDisplay

	var body: some View {
		HStack {
			label
			// TODO: add description below name
			Spacer(minLength: 48)
			shortcutDisplay
		}
	}
}

// MARK: - Supporting Views

private extension CheatSheetItem {
	@ViewBuilder var label: some View {
		Group {
			if let icon = shortcut.icon {
				Label(
					title: { Text(shortcut.name) },
					icon: { icon }
				)
			} else {
				Text(shortcut.name)
			}
		}
	}

	@ViewBuilder var shortcutDisplay: some View {
		let text: String = [
			shortcut.keyboardShortcut.modifiers.description,
			String(shortcut.keyboardShortcut.key.character).uppercased(),
		].joined(separator: " ")

		Text(text)
			.monospaced()
			.foregroundStyle(.secondary)
	}
}
