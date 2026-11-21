
# Lab 2C: Protocols, Extensions, and Generics

## Objective
Understand Swift protocols, extensions, generic types,
and generic functions with protocol constraints.

## R1: Protocol and Conformance

Created a Displayable protocol containing a displayInfo() method.

Created:
- Student
- Course

Both types conform to Displayable and provide their own
implementation of displayInfo().

## R2: Extensions

Created an extension on String.

Added:
- wordCount: A computed property that counts words.
- formattedText(): A helper method that trims extra whitespace.

Extensions allow existing types to be enhanced with
additional functionality.

## R3: Generic Stack

Created a generic Stack<T> structure.

Implemented:
- push(): Adds an element.
- pop(): Removes and returns the top element.
- peek(): Returns the top element without removing it.
- isEmpty: Checks whether the stack is empty.

The Stack can store different types of elements because it is generic.

## R4: Generic Protocol Constraint

Created a generic function:

displayItems<T: Displayable>(_ items: [T])

The function only accepts types that conform to Displayable.

### Valid Use
Student and Course conform to Displayable, so both can be passed
to the generic function.

### Invalid Use
A type that does not conform to Displayable cannot be passed
to this function.

An invalid example is included as a comment in the source code
because uncommenting it would cause a compilation error.

## R5: Extensions and Stored State

Extensions can add:
- Computed properties
- Methods
- Initializers in certain cases
- Protocol conformances

Extensions cannot add stored instance properties to an existing type.

When new stored state is required, a new type should be created
or the original type definition should be modified.

## Conclusion

This lab demonstrates protocols, protocol conformance,
extensions, generic stacks, and generic functions with
protocol constraints in Swift.
