import SwiftUI

struct CheatSheetModifier: ViewModifier {
	@Environment(\.cheatSheetRevealDelay) private var revealDelay
	@StateObject private var cheatSheetState: CheatSheetState = CheatSheetState()

	let groups: [KeyboardShortcutGroup]

	func body(content: Content) -> some View {
		content
			.onAppear(perform: cheatSheetState.createEventMonitor)
			.onDisappear(perform: cheatSheetState.destroyEventMonitor)
			.overlay {
				if cheatSheetState.state {
					ContentView(groups: groups)
						.transition(.opacity.combined(with: .scale(scale: 0.98, anchor: .bottom)))
				}
			}
			.animation(.easeOut(duration: 0.1), value: cheatSheetState.state)
			.onChange(of: revealDelay) { _ in
				cheatSheetState.revealDelay = revealDelay
			}
	}
}

// MARK: - View Modifier

public extension View {
	/// Add a cheat sheet overlay and required event monitors to this view.
	/// - Parameter shortcuts: The shortcuts to display on the cheat sheet.
	func cheatSheet<S: Sequence>(_ shortcuts: S) -> some View where S.Element == KeyboardShortcutDisplay {
		modifier(CheatSheetModifier(groups: [KeyboardShortcutGroup(nil, shortcuts: shortcuts)]))
	}

	/// Add a cheat sheet overlay and required event monitors to this view.
	/// - Parameter groups: The groups of keyboard shortcut to display on the cheat sheet.
	func cheatSheet<S: Sequence>(_ groups: S) -> some View where S.Element == KeyboardShortcutGroup {
		modifier(CheatSheetModifier(groups: Array(groups)))
	}

	/// Add a cheat sheet overlay and required event monitors to this view.
	/// - Parameter groups: The groups of keyboard shortcut to display on the cheat sheet.
	func cheatSheet(_ firstGroup: KeyboardShortcutGroup, _ additionalGroups: KeyboardShortcutGroup...) -> some View {
		modifier(CheatSheetModifier(groups: [firstGroup] + additionalGroups))
	}
}
