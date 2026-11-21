
# Lab 2B: Closures

## Objective
Understand Swift closures, closure sorting, completion handlers,
trailing closures, shorthand arguments, captured state, and retain cycles.

## R1: Sort Students Using a Closure

Created a Student structure containing student name and marks.

Used the sorted() method with a closure to sort students
according to marks in descending order.

## R2: Completion Closure

Created a function that accepts a completion closure.

The function simulates an operation and executes the completion
closure after the operation finishes.

This demonstrates how completion handlers are used in Swift.

## R3: Trailing Closure and Shorthand Arguments

Demonstrated:

- Trailing closure syntax.
- Explicit closure parameter names.
- Shorthand argument names using $0 and $1.
- map() with a shorthand closure.

These syntax features make closure-based code concise.

## R4: Counter Closure

Created a counter function that returns a closure.

The closure captures the count variable and retains its state
between multiple calls.

The count variable continues to be updated even after the
original makeCounter function has finished execution.

## R5: Avoid Retain Cycles

Created a TaskManager class that stores a completion closure.

Used [weak self] in the closure capture list.

Weak self prevents the closure from strongly retaining the
TaskManager object, helping avoid a retain cycle.

Used deinit to demonstrate object deallocation.

## Conclusion

This lab demonstrates closures, sorting, completion handlers,
trailing closure syntax, shorthand arguments, captured state,
and safe memory management using weak self.
