import SwiftUI

struct CheatSheetLabeledContentStyle: LabeledContentStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		HStack {
			configuration.label
				.font(.headline)

			Spacer(minLength: 48)

			configuration.content
		}
	}
}

// MARK: - Convenience

extension LabeledContentStyle where
	Self == CheatSheetLabeledContentStyle
{
	static var cheatSheet: Self {
		Self()
	}
}
