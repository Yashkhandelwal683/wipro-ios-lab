
# Milestone 1: Swift Foundations

## R1: Gradebook

Implemented a gradebook using arrays and dictionaries.

- Used an array to store student information.
- Used a dictionary to map student IDs to marks.
- Used optional binding to safely look up marks.
- Used nil-coalescing to handle missing values.
- Calculated average marks using map and reduce.

## R2: Generic Stack

Created a generic Stack<T>.

Implemented:
- push()
- pop()
- peek()
- isEmpty

Demonstrated the stack using:
- Int
- String

Generics allow the same stack implementation to work
with different data types.

## R3: Retain Cycle Fix

Created a TaskOwner class that stores a completion closure.

Demonstrated a closure using weak self.

### Retain Cycle
A retain cycle occurs when objects strongly retain each other
directly or indirectly, preventing ARC from releasing them.

### Fix
Used [weak self] in the closure capture list.

Weak references do not increase the strong reference count
of the referenced object.

The object can therefore be released when no strong references
remain.

## R4: Throwing Validation

Created a GradeValidationError enum with:

- emptyName
- invalidMarks

Created a throwing validateStudent function.

The function validates:
- Name must not be empty.
- Marks must be between 0 and 100.

Used do-catch to handle two distinct errors.

## R5: Viva

### Struct vs Class

Struct:
- Value type.
- Copies when assigned or passed.
- Does not support class inheritance.

Class:
- Reference type.
- Multiple variables can refer to the same object.
- Supports inheritance.
- Uses ARC for reference management.

### Protocol vs Inheritance

Protocol:
- Defines requirements.
- Types conform to protocols.
- A type can conform to multiple protocols.

Inheritance:
- Classes can inherit properties and methods from another class.
- A class generally has one superclass.

### map

Transforms every element in a collection.

Example:
numbers.map { $0 * 2 }

### filter

Selects elements that satisfy a condition.

Example:
numbers.filter { $0 % 2 == 0 }

### reduce

Combines collection elements into a single value.

Example:
numbers.reduce(0, +)

## Conclusion

This milestone demonstrates gradebooks, arrays, dictionaries,
safe optionals, generic stacks, ARC, retain cycle prevention,
throwing validation, and foundational Swift viva concepts.
