import SwiftUI

struct CheatSheetPanel<SheetContent: View>: View {
	private let sheetContent: () -> SheetContent

	init(content sheetContent: @escaping () -> SheetContent) {
		self.sheetContent = sheetContent
	}

	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Divided {
				sheetContent()
			}
		}
		.groupBoxStyle(.cheatSheet)
		.labeledContentStyle(.cheatSheet)
		.labelStyle(.cheatSheet)
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
