import SwiftUI

struct ContentView: View {
	let groups: [KeyboardShortcutGroup]

	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			// TODO: support multiple columns
			ForEach(groups.indices, id: \.self) { i in
				if let name = groups[i].name {
					Text(name)
						.font(.headline)
				}

				ForEach(groups[i].shortcuts.indices, id: \.self) { j in
					CheatSheetItem(shortcut: groups[i].shortcuts[j])
				}

				if i != groups.indices.last {
					Divider()
				}
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
