
# Lab 1D: Optionals and Safe Unwrapping

## Objective
Understand and use Swift optionals safely by using optional binding,
optional chaining, nil-coalescing, and safe handling of missing values.

## R1: Optional Result Function

Created a function `getMarks(for:)` that searches for student marks
using a student ID.

The function returns `Int?` because a student ID may or may not
exist in the Dictionary.

- If the student exists, marks are returned.
- If the student does not exist, nil is returned.

## R2: Optional Handling Techniques

### if let
Used if let to safely unwrap an optional value when it contains data.

### guard let
Used guard let to handle missing values and exit the function
early if the optional value is nil.

### Optional Chaining
Used optional chaining to safely access and transform an optional
String using uppercased().

### Nil-Coalescing Operator
Used the ?? operator to provide a default value when the optional
marks result is nil.

## R3: Missing Dictionary Key and Empty Text

- Handled a missing Dictionary key without crashing.
- Used guard to reject empty or whitespace-only text.
- Displayed appropriate messages for invalid input.

## R4: Force Unwrapping

Avoided force unwrapping using the ! operator.

Optional values are safely handled using:
- if let
- guard let
- nil-coalescing

This prevents runtime crashes caused by unexpectedly missing values.

## Conclusion

This lab demonstrates safe optional handling in Swift.
Optional values are checked before use, missing Dictionary keys
are handled gracefully, and empty text inputs are validated.
