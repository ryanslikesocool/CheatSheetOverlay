import SwiftUI

struct CheatSheetLabelStyle: LabelStyle {
	@Environment(\.keyboardShortcut) private var keyboardShortcut: KeyboardShortcut?

	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		if let keyboardShortcut {
			LabeledContent {
				Text(keyboardShortcut.displayString)
					.monospaced()
					.foregroundStyle(.secondary)
			} label: {
				HStack {
					configuration.icon
					configuration.title
				}
				.fontWeight(.medium)
			}
		}
	}
}

// MARK: - Convenience

extension LabelStyle where
	Self == CheatSheetLabelStyle
{
	static var cheatSheet: Self {
		Self()
	}
}
