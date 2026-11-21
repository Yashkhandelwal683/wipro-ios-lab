
# Lab 3: Compare UIKit and SwiftUI

## Objective
Create the same simple screen using both SwiftUI and UIKit
and compare their development approaches.

## R1: Create the Same Screen

Created a simple screen in SwiftUI and UIKit containing:

- Title
- Text field
- Button
- Result label

Both implementations allow the user to enter their name
and display a result after pressing the button.

## R2: SwiftUI State

Used @State to store the entered name and result message.

When the button is tapped, the result variable is updated.
SwiftUI automatically refreshes the UI when state changes.

## R3: UIKit Actions

Used UIKit controls:

- UILabel
- UITextField
- UIButton
- UIStackView

Connected the button using addTarget() and an action method
using @objc.

Updated the result label manually after button interaction.

## R4: Comparison

### Amount of Code
SwiftUI requires less code for creating a simple screen.

UIKit requires more setup code for creating controls,
configuring layouts, and connecting actions.

### State Updates
SwiftUI uses @State and automatically updates the UI.

UIKit generally requires manually updating UI properties.

### Layout Approach
SwiftUI uses declarative layout with VStack, HStack,
padding, and modifiers.

UIKit uses views, constraints, stack views,
and programmatic layout or Interface Builder.

### Previews
SwiftUI supports convenient previews using #Preview.

UIKit traditionally relies on running the screen in the simulator
or using additional preview tooling.

### Interoperability
SwiftUI can integrate UIKit components using UIViewRepresentable.

UIKit can host SwiftUI views using UIHostingController.

## R5: Team Recommendation

### Choose SwiftUI when:
- Building new iOS applications.
- Developing simple and modern interfaces.
- Working with declarative UI.
- Wanting faster UI development and previews.

### Choose UIKit when:
- Maintaining older iOS applications.
- Working with existing UIKit codebases.
- Requiring UIKit-specific APIs or workflows.
- Working on complex interfaces where UIKit integration
  is already established.

### Final Recommendation
For most new iOS projects, SwiftUI is a good starting choice
because it reduces boilerplate and simplifies state-driven UI.

UIKit remains valuable for legacy applications,
specialized interfaces, and interoperability requirements.

## Conclusion

This lab demonstrates the same interface in SwiftUI and UIKit
and compares state management, layout, previews,
code complexity, and interoperability.
