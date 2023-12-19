import SwiftUI

struct CheatSheetActivationModifierKey: EnvironmentKey {
	static let defaultValue: NSEvent.ModifierFlags = .command
}

extension EnvironmentValues {
	var cheatSheetActivationModifier: NSEvent.ModifierFlags {
		get { self[CheatSheetActivationModifierKey.self] }
		set { self[CheatSheetActivationModifierKey.self] = newValue }
	}
}

public extension View {
	/// Set the modifier key(s) used to activate the cheat sheet.
	func cheatSheetActivationModifier(_ activationModifier: NSEvent.ModifierFlags) -> some View {
		environment(\.cheatSheetActivationModifier, activationModifier)
	}
}
