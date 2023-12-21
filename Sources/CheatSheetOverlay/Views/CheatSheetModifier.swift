import SwiftUI

struct CheatSheetModifier<SheetContent: View>: ViewModifier {
	@StateObject private var cheatSheetState: CheatSheetState

	private let sheetContent: () -> SheetContent

	init(revealDelay: TimeInterval, activationKey: NSEvent.ModifierFlags, content sheetContent: @escaping () -> SheetContent) {
		self.sheetContent = sheetContent
		_cheatSheetState = StateObject(wrappedValue: CheatSheetState(revealDelay: revealDelay, activationKey: activationKey))
	}

	func body(content: Content) -> some View {
		content
			.onAppear(perform: cheatSheetState.createEventMonitor)
			.onDisappear(perform: cheatSheetState.destroyEventMonitor)
			.overlay {
				if cheatSheetState.state {
					CheatSheetPanel(content: sheetContent)
						.transition(.opacity.combined(with: .scale(scale: 0.98, anchor: .bottom)))
				}
			}
			.animation(.easeOut(duration: 0.1), value: cheatSheetState.state)
	}
}

// MARK: - View Modifier

public extension View {
	/// Add a cheat sheet overlay and required event monitors to this view.
	/// - Parameters:
	///   - revealDelay: The time between when the activation key is held and when the cheat sheet appears.
	///   - activationKey: The key held to activate the cheat sheet.
	///   - content: The content of the cheat sheet.
	func cheatSheet<Content: View>(
		revealDelay: TimeInterval = 0.75,
		activationKey: NSEvent.ModifierFlags = .command,
		@ViewBuilder content: @escaping () -> Content
	) -> some View {
		modifier(CheatSheetModifier(revealDelay: revealDelay, activationKey: activationKey, content: content))
	}
}
