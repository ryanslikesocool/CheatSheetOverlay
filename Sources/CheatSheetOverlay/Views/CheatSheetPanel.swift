import SwiftUI

struct CheatSheetPanel<SheetContent>: View where
	SheetContent: View
{
	private let sheetContent: () -> SheetContent

	public init(content sheetContent: @escaping () -> SheetContent) {
		self.sheetContent = sheetContent
	}

	public var body: some View {
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
}

// MARK: - Supporting Views

private extension CheatSheetPanel {
	var containerShape: RoundedRectangle {
		RoundedRectangle(cornerRadius: 16)
	}
}
