# CheatSheetOverlay
Keyboard shortcut cheat sheet overlay for SwiftUI
![A preview of the cheat sheet, displaying multiple keyboard shortcut items in a vertical list](images~/preview.png)

## Requirements
CheatSheetOverlay requires macOS 13.0 or later.

## Installation
CheatSheetOverlay can be added to projects as a Swift package.
```swift
.package(url: "https://github.com/ryanslikesocool/CheatSheetOverlay", from: "0.1.0"),
```

## Usage
### KeyboardShortcutDisplay
Keyboard shortcuts that display on the cheat sheet are a wrapper around `SwiftUI.KeyboardShortcut`.
```swift
let copyKeyboardShortcut = KeyboardShortcutDisplay("Copy", systemImage: "doc.on.doc", shortcut: KeyboardShortcut("c"))
```

### KeyboardShortcutGroup
Keyboard shortcut groups are visually separated in the cheat sheet and can be given their own title and icon.
```swift
let textCommands = KeyboardShortcutGroup(
	"Text Commands",
	shortcuts: [
		KeyboardShortcutDisplay("Copy", systemImage: "doc.on.doc", shortcut: KeyboardShortcut("c")),
		KeyboardShortcutDisplay("Paste", systemImage: "arrow.right.doc.on.clipboard", shortcut: KeyboardShortcut("v")),
		KeyboardShortcutDisplay("Cut", systemImage: "scissors", shortcut: KeyboardShortcut("x")),
	]
)
```

### Cheat Sheet
The cheat sheet can be added to a view with the `.cheatSheet` view modifier
```swift
ContentView()
	.cheatSheet([
		textCommands,
		[
			KeyboardShortcutDisplay("Print", systemImage: "printer", shortcut: KeyboardShortcut("p")),
			KeyboardShortcutDisplay("Go Wild", systemImage: "sparkles", shortcut: KeyboardShortcut(.return, modifiers: [.control, .option, .shift, .command])),
		]
	])
```

### Delay
The delay between when the activation key is held and when the cheat sheet appears can be changed with an environment key.\
This value is set to `0.5` by default.
```swift
ContentView()
	.cheatSheetRevealDelay(0.5)
```

### Activation Key
The activation key that must be pressed for the cheat sheet to appear.  This can be set to a single value or a combination of values.\
This value is set to `.command` (the ⌘ key) by default.
```swift
ContentView()
	.cheatSheetActivationKey(.command)
```
