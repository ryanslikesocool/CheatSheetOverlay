import SwiftUI

struct CheatSheetGroupBoxStyle: GroupBoxStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		VStack(alignment: .leading, spacing: 16) {
			configuration.label
				.font(.headline)

			configuration.content
		}
	}
}

// MARK: - Convenience

extension GroupBoxStyle where
	Self == CheatSheetGroupBoxStyle
{
	static var cheatSheet: Self {
		Self()
	}
}
