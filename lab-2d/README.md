
# Lab 2D: Error Handling

## Objective
Understand Swift error handling using Error, throws, do-catch,
Optional, and Result.

## R1: ValidationError

Created a ValidationError enum conforming to Error.

Cases:
- emptyName
- invalidMarks
- invalidID

These cases represent invalid student registration input.

## R2: Student Registration Function

Created a throwing function named registerStudent.

The function validates:
- Student name must not be empty.
- Student ID must be greater than zero.
- Marks must be between 0 and 100.

The function throws ValidationError when validation fails.
Otherwise, it returns a RegisteredStudent object.

## R3: do-catch

Used do-catch to handle registration errors.

Different catch blocks display useful messages for:
- Empty student name.
- Invalid student ID.
- Invalid marks.

Invalid inputs are handled without crashing the application.

## R4: throws, Optional and Result

### throws
Throws allows a function to report an error when an operation fails.

### Optional
Optional returns either a value or nil.
It is useful when a result may be unavailable but detailed error
information is not required.

### Result
Result represents either success or failure.
It stores a successful value or an error and can be handled
using a switch statement.

## R5: Safe Invalid Input

Tested valid and invalid registration inputs.

Expected errors are handled using do-catch.
No force try or force unwrapping is used.

The application completes without crashing for expected
validation errors.

## Conclusion

This lab demonstrates custom errors, throwing functions,
do-catch, Optional, Result, and safe handling of invalid inputs.
