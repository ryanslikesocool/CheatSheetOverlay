#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif
import SwiftUI

final class CheatSheetState: ObservableObject {
	static let shared: CheatSheetState = CheatSheetState()
	
	@Published var state: Bool = false
	
	var revealDelay: TimeInterval = CheatSheetRevealDelayKey.defaultValue

	private var eventMonitor: Any? = nil
	private var revealTimer: Timer? = nil
		
	func createEventMonitor() {
		NSEvent.addLocalMonitorForEvents(matching: .flagsChanged, handler: onEvent)
	}
	
	func destroyEventMonitor() {
		if let eventMonitor {
			NSEvent.removeMonitor(eventMonitor)
			self.eventMonitor = nil
		}
	}
	
	private func onEvent(_ event: NSEvent) -> NSEvent? {
		let state = event.modifierFlags.contains(.command)

		if state {
			revealTimer = Timer.scheduledTimer(withTimeInterval: revealDelay, repeats: false) { [weak self] _ in
				self?.pushState(state)
			}
		} else {
			pushState(state)
		}
		
		return event
	}
	
	private func pushState(_ state: Bool) {
		self.state = state
		cancelTimer()
	}

	private func cancelTimer() {
		revealTimer?.invalidate()
		revealTimer = nil
	}
}
