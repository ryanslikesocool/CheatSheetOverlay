import SwiftUI

struct CheatSheet: View {
	let shortcuts: [KeyboardShortcutDisplay]

	var body: some View {
		VStack(spacing: 16) {
			ForEach(shortcuts.indices, id: \.self) { i in
				SheetItem(shortcut: shortcuts[i])
			}
		}
		.fixedSize()
		.padding(24)
		.background(.regularMaterial, in: containerShape)
		.overlay(.separator, in: containerShape.stroke(lineWidth: 1))
		.compositingGroup()
		.shadow(radius: 8, y: 4)
	}

	private var containerShape: RoundedRectangle {
		RoundedRectangle(cornerRadius: 16)
	}
}
