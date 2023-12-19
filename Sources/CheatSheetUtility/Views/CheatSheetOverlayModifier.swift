import SwiftUI

struct CheatSheetOverlayModifier: ViewModifier {
	@Environment(\.cheatSheetRevealDelay) private var revealDelay
	@ObservedObject private var cheatSheetState: CheatSheetState = .shared

	let groups: [KeyboardShortcutGroup]

	func body(content: Content) -> some View {
		content
			.onAppear(perform: cheatSheetState.createEventMonitor)
			.onDisappear(perform: cheatSheetState.destroyEventMonitor)
			.overlay {
				if cheatSheetState.state {
					CheatSheet(groups: groups)
						.transition(.opacity.combined(with: .scale(scale: 0.98, anchor: .bottom)))
				}
			}
			.animation(.easeOut(duration: 0.1), value: cheatSheetState.state)
			.onChange(of: revealDelay) { _ in
				cheatSheetState.revealDelay = revealDelay
			}
	}
}

public extension View {
	func cheatSheetOverlay<S: Sequence>(_ shortcuts: S) -> some View where S.Element == KeyboardShortcutDisplay {
		modifier(CheatSheetOverlayModifier(groups: [KeyboardShortcutGroup(nil, shortcuts: shortcuts)]))
	}

	func cheatSheetOverlay<S: Sequence>(_ groups: S) -> some View where S.Element == KeyboardShortcutGroup {
		modifier(CheatSheetOverlayModifier(groups: Array(groups)))
	}

	func cheatSheetOverlay(_ firstGroup: KeyboardShortcutGroup, _ additionalGroups: KeyboardShortcutGroup...) -> some View {
		modifier(CheatSheetOverlayModifier(groups: [firstGroup] + additionalGroups))
	}
}
