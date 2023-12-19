import SwiftUI

struct CheatSheetRevealDelayKey: EnvironmentKey {
	static let defaultValue: TimeInterval = 0.5
}

extension EnvironmentValues {
	var cheatSheetRevealDelay: TimeInterval {
		get { self[CheatSheetRevealDelayKey.self] }
		set { self[CheatSheetRevealDelayKey.self] = newValue }
	}
}

public extension View {
	/// Set the delay between when the user starts holding the command key and when the cheatsheet overlay appears.
	/// - Parameter delay: The delay, in seconds, before the cheatsheet appears.
	func cheatSheetRevealDelay(_ delay: TimeInterval) -> some View {
		environment(\.cheatSheetRevealDelay, delay)
	}
}
