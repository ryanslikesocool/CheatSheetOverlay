import SwiftUI

// From https://movingparts.io/variadic-views-in-swiftui#writing-our-own-container-view

struct Divided<Content>: View where
	Content: View
{
	private let content: () -> Content

	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public var body: some View {
		_VariadicView.Tree(DividedLayout(), content: content)
	}
}

struct DividedLayout: _VariadicView_MultiViewRoot {
	@ViewBuilder
	public func body(children: _VariadicView.Children) -> some View {
		let last = children.last?.id

		ForEach(children) { child in
			child

			if child.id != last {
				Divider()
			}
		}
	}
}
