
# Lab 1E: Classes, Structs, ARC, and Memory

## Objective
Understand Swift structs, classes, value semantics, reference semantics,
ARC, ownership, weak references, and closure capture.

## R1: Struct and Class

Created a Course struct to store:
- Course name
- Instructor name
- Credits

Created a CourseManager class to manage a collection of courses.
The class provides methods to add and display courses.

## R2: Value and Reference Behaviour

### Struct
Structs are value types.
When a struct is copied, an independent copy is created.

Changing the copied struct does not affect the original struct.

### Class
Classes are reference types.
When a class instance is assigned to another variable,
both variables refer to the same object.

Changing the object through one reference affects the other reference.

## R3: Weak and Strong Ownership

Created two related reference types:

- Classroom
- Teacher

The Classroom strongly holds its Teacher.
The Teacher weakly references the Classroom.

A weak reference does not increase the reference count.
This ownership arrangement prevents a strong reference cycle.

Used deinit to demonstrate object deallocation.

## R4: Closure Reference Cycle

Demonstrated a closure capturing self strongly.

A strong reference cycle can occur when:
- An object retains a closure.
- The closure strongly captures the same object.

The cycle was manually broken by setting the closure to nil.

Also demonstrated [weak self] in a closure capture list.
Weak capture prevents the closure from strongly retaining the object.

## R5: Value Semantics, Reference Semantics and ARC

### Value Semantics
Structs are value types.
Copies behave independently.

### Reference Semantics
Classes are reference types.
Multiple references can point to the same instance.

### ARC
Automatic Reference Counting manages the memory of class instances.

### Weak
Weak references do not keep an object alive.
They become nil when the referenced object is deallocated.

### Closure Capture
Closures may strongly capture objects.
Capture lists such as [weak self] can help prevent memory leaks
caused by reference cycles.

## Conclusion

This lab demonstrates structs, classes, copying behaviour,
ownership relationships, ARC, weak references, and closure
reference cycle prevention in Swift.
