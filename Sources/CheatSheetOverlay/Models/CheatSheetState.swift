import AppKit
import SwiftUI

final class CheatSheetState: ObservableObject {
	@Published var state: Bool = false

	private let revealDelay: TimeInterval
	private let activationKey: NSEvent.ModifierFlags

	private var eventMonitor: Any? = nil
	private var revealTimer: Timer? = nil

	init(revealDelay: TimeInterval, activationKey: NSEvent.ModifierFlags) {
		self.revealDelay = revealDelay
		self.activationKey = activationKey
	}
}

// MARK: - Event Monitor

extension CheatSheetState {
	/// Create the event monitor to listen for the activation key.
	func createEventMonitor() {
		eventMonitor = NSEvent.addLocalMonitorForEvents(matching: [.flagsChanged, .keyDown], handler: onEvent)
	}

	/// Destroy the event monitor listening for the activation key.
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
		switch event.type {
			case .flagsChanged:
				if event.modifierFlags.intersection(.deviceIndependentFlagsMask) == activationKey {
					revealTimer = Timer.scheduledTimer(withTimeInterval: revealDelay, repeats: false) { [weak self] _ in
						self?.applyState(true)
					}
				} else {
					applyState(false)
				}
			case .keyDown:
				applyState(false)
			default:
				break
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
