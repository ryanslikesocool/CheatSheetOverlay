import SwiftUI

struct CheatSheetRevealDelayKey: EnvironmentKey {
	static let defaultValue: TimeInterval = 0.5
}

public extension EnvironmentValues {
	var cheatSheetRevealDelay: TimeInterval {
		get { self[CheatSheetRevealDelayKey.self] }
		set { self[CheatSheetRevealDelayKey.self] = newValue }
	}
}

public extension View {
	func cheatSheetRevealDelay(_ delay: TimeInterval) -> some View {
		environment(\.cheatSheetRevealDelay, delay)
	}
}
