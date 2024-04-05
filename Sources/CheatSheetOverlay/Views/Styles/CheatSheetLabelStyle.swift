import SwiftUI

struct CheatSheetLabelStyle: LabelStyle {
	@Environment(\.keyboardShortcut) private var keyboardShortcut: KeyboardShortcut?

	func makeBody(configuration: Configuration) -> some View {
		if let keyboardShortcut {
			LabeledContent(content: {
				Text(keyboardShortcut.displayString)
					.monospaced()
					.foregroundStyle(.secondary)
			}, label: {
				HStack {
					configuration.icon
					configuration.title
				}
				.fontWeight(.medium)
			})
		}
	}
}

extension LabelStyle where Self == CheatSheetLabelStyle {
	static var cheatSheet: Self { Self() }
}
