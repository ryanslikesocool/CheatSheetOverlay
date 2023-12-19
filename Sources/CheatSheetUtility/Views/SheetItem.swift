import SwiftUI

struct SheetItem: View {
	let shortcut: KeyboardShortcutDisplay

	var body: some View {
		HStack {
			label
			// TODO: description below name
			Spacer(minLength: 48)
			shortcutDisplay
		}
	}
}

private extension SheetItem {
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
