import SwiftUI

struct CheatSheetGroupBoxStyle: GroupBoxStyle {
	func makeBody(configuration: Configuration) -> some View {
		VStack(alignment: .leading, spacing: 16) {
			configuration.label
				.font(.headline)

			configuration.content
		}
	}
}

extension GroupBoxStyle where Self == CheatSheetGroupBoxStyle {
	static var cheatSheet: Self { Self() }
}
