
import Foundation

// MARK: - R1: Gradebook using Arrays, Dictionaries and Optionals

print("===== R1: GRADEBOOK =====")

struct GradeStudent {
    let id: Int
    let name: String
    let marks: Int
}

var students: [GradeStudent] = [
    GradeStudent(id: 101, name: "Yash", marks: 95),
    GradeStudent(id: 102, name: "Unnati", marks: 88),
    GradeStudent(id: 103, name: "Aman", marks: 76)
]

// Dictionary mapping student ID to marks
var gradebook: [Int: Int] = [:]

for student in students {
    gradebook[student.id] = student.marks
}

print("Gradebook:", gradebook)

// Safe optional lookup
let searchedID = 101

if let marks = gradebook[searchedID] {
    print("Marks for ID \(searchedID):", marks)
} else {
    print("Student ID not found.")
}

// Missing key handled safely
let missingID = 999
print("Missing ID result:", gradebook[missingID] ?? "No marks found")

// Calculate average
let allMarks = students.map { $0.marks }
let average = allMarks.reduce(0, +) / allMarks.count

print("Average marks:", average)


// MARK: - R2: Generic Stack with Two Types

print("\n===== R2: GENERIC STACK =====")

struct Stack<T> {
    private var items: [T] = []

    var isEmpty: Bool {
        items.isEmpty
    }

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        items.popLast()
    }

    func peek() -> T? {
        items.last
    }
}

// Stack of Integers
var integerStack = Stack<Int>()
integerStack.push(10)
integerStack.push(20)
integerStack.push(30)

print("Integer stack top:", integerStack.peek() ?? -1)
print("Integer popped:", integerStack.pop() ?? -1)

// Stack of Strings
var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("UIKit")
stringStack.push("SwiftUI")

print("String stack top:", stringStack.peek() ?? "Empty")
print("String popped:", stringStack.pop() ?? "Empty")


// MARK: - R3: Retain Cycle and Its Fix

print("\n===== R3: RETAIN CYCLE FIX =====")

class TaskOwner {
    var completion: (() -> Void)?

    func startTask() {
        completion = { [weak self] in
            guard let self = self else {
                print("Owner no longer exists.")
                return
            }

            print("Task completed for:", self.name)
        }
    }

    let name: String

    init(name: String) {
        self.name = name
        print("\(name) initialized")
    }

    deinit {
        print("\(name) deinitialized")
    }
}

var owner: TaskOwner? = TaskOwner(name: "TaskOwner")

owner?.startTask()
owner?.completion?()

// Release the object
owner = nil

print("Owner released. weak self prevents a retain cycle.")

/*
 BROKEN VERSION (retain cycle):

 completion = {
     print(self.name)
 }

 If the object owns the closure and the closure strongly captures self,
 a strong reference cycle can occur.

 FIX:
 [weak self] in the capture list prevents the closure from
 strongly retaining the object.
*/


// MARK: - R4: Throwing Validation Function

print("\n===== R4: THROWING VALIDATION =====")

enum GradeValidationError: Error {
    case emptyName
    case invalidMarks
}

func validateStudent(name: String, marks: Int) throws {

    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        throw GradeValidationError.emptyName
    }

    guard marks >= 0 && marks <= 100 else {
        throw GradeValidationError.invalidMarks
    }

    print("Valid student:", name, "Marks:", marks)
}

func testValidation(name: String, marks: Int) {

    do {
        try validateStudent(name: name, marks: marks)

    } catch GradeValidationError.emptyName {
        print("Error: Name cannot be empty.")

    } catch GradeValidationError.invalidMarks {
        print("Error: Marks must be between 0 and 100.")

    } catch {
        print("Unexpected error:", error)
    }
}

testValidation(name: "Rahul", marks: 90)
testValidation(name: "", marks: 90)
testValidation(name: "Aman", marks: 150)


// MARK: - R5: Viva Demonstration

print("\n===== R5: VIVA =====")

print("Struct: Value type, copies its value.")
print("Class: Reference type, objects share references.")
print("Protocol: Defines requirements for conforming types.")
print("Inheritance: A class can inherit behavior from another class.")
print("Map: Transforms elements.")
print("Filter: Selects elements based on a condition.")
print("Reduce: Combines elements into a single value.")

let numbers = [1, 2, 3, 4, 5]

let doubled = numbers.map { $0 * 2 }
let evenNumbers = numbers.filter { $0 % 2 == 0 }
let sum = numbers.reduce(0, +)

print("Map:", doubled)
print("Filter:", evenNumbers)
print("Reduce:", sum)

print("\nMilestone completed.")
