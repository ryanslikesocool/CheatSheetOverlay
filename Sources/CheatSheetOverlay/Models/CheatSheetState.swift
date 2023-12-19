import AppKit
import SwiftUI

final class CheatSheetState: ObservableObject {
	@Published var state: Bool = false

	var revealDelay: TimeInterval = CheatSheetRevealDelayKey.defaultValue
	var activationModifier: NSEvent.ModifierFlags = CheatSheetActivationModifierKey.defaultValue

	private var eventMonitor: Any? = nil
	private var revealTimer: Timer? = nil
}

// MARK: - Event Monitor

extension CheatSheetState {
	/// Create the event monitor to listen for the command key.
	func createEventMonitor() {
		eventMonitor = NSEvent.addLocalMonitorForEvents(matching: .flagsChanged, handler: onEvent)
	}

	/// Destroy the event monitor listening for the command key.
	func destroyEventMonitor() {
		if let eventMonitor {
			NSEvent.removeMonitor(eventMonitor)
			self.eventMonitor = nil
		}
	}
}

// MARK: - State

private extension CheatSheetState {
	/// Receive an event from the event monitor.
	func onEvent(_ event: NSEvent) -> NSEvent? {
		let state = event.modifierFlags.contains(activationModifier)

		if state {
			revealTimer = Timer.scheduledTimer(withTimeInterval: revealDelay, repeats: false) { [weak self] _ in
				self?.applyState(state)
			}
		} else {
			applyState(state)
		}

		return event
	}

	/// Apply the current cheat sheet state.
	func applyState(_ state: Bool) {
		self.state = state
		cancelTimer()
	}

	/// Cancel the cheat sheet reveal timer.
	func cancelTimer() {
		revealTimer?.invalidate()
		revealTimer = nil
	}
}
