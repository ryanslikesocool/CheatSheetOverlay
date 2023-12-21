import SwiftUI

struct CheatSheetLabeledContentStyle: LabeledContentStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.label
				.font(.headline)

			Spacer(minLength: 48)

			configuration.content
		}
	}
}

extension LabeledContentStyle where Self == CheatSheetLabeledContentStyle {
	static var cheatSheet: Self { Self() }
}
