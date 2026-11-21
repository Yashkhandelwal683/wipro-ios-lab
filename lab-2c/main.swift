
import Foundation

// MARK: - R1: Protocol and Conformance

print("===== R1: PROTOCOL =====")

protocol Displayable {
    func displayInfo() -> String
}

struct Student: Displayable {
    let name: String
    let marks: Int

    func displayInfo() -> String {
        return "Student: \(name), Marks: \(marks)"
    }
}

struct Course: Displayable {
    let name: String
    let instructor: String

    func displayInfo() -> String {
        return "Course: \(name), Instructor: \(instructor)"
    }
}

let student = Student(name: "Yash", marks: 95)
let course = Course(name: "Swift", instructor: "Mr. Vishal")

print(student.displayInfo())
print(course.displayInfo())


// MARK: - R2: Extension

print("\n===== R2: EXTENSION =====")

extension String {
    var wordCount: Int {
        return self.split(separator: " ").count
    }

    func formattedText() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let sentence = "Swift Protocols and Generics"

print("Sentence:", sentence)
print("Word count:", sentence.wordCount)
print("Formatted:", "   Swift Programming   ".formattedText())


// MARK: - R3: Generic Stack

print("\n===== R3: GENERIC STACK =====")

struct Stack<T> {
    private var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    mutating func push(_ element: T) {
        elements.append(element)
    }

    mutating func pop() -> T? {
        return elements.popLast()
    }

    func peek() -> T? {
        return elements.last
    }
}

var numberStack = Stack<Int>()

numberStack.push(10)
numberStack.push(20)
numberStack.push(30)

print("Is stack empty:", numberStack.isEmpty)
print("Top element:", numberStack.peek() ?? -1)
print("Popped:", numberStack.pop() ?? -1)
print("New top:", numberStack.peek() ?? -1)


// MARK: - R4: Generic Protocol Constraint

print("\n===== R4: GENERIC CONSTRAINT =====")

func displayItems<T: Displayable>(_ items: [T]) {
    for item in items {
        print(item.displayInfo())
    }
}

displayItems([student])
displayItems([course])

// VALID:
// Student and Course conform to Displayable.

// INVALID:
// struct Book {
//     let title: String
// }
//
// displayItems([Book(title: "Swift Guide")])
//
// This would fail because Book does not conform to Displayable.


// MARK: - R5: Extension vs New Type

print("\n===== R5: EXTENSION LIMITATIONS =====")

print("Extensions add computed properties and methods to existing types.")
print("Extensions cannot add stored instance properties.")
print("Stored state requires a new type or modifying the original type.")


// Example of a type with stored state
struct Product {
    var name: String
    var price: Double
}
