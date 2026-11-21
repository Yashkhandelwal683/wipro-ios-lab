
import Foundation

// MARK: - R1: Sort Students Using a Closure

print("===== R1: SORT USING CLOSURE =====")

struct Student {
    let name: String
    let marks: Int
}

let students = [
    Student(name: "Yash", marks: 90),
    Student(name: "Aman", marks: 75),
    Student(name: "Rahul", marks: 85),
    Student(name: "Priya", marks: 95)
]

// Sorting using a closure
let sortedStudents = students.sorted { first, second in
    first.marks > second.marks
}

for student in sortedStudents {
    print(student.name, "-", student.marks)
}


// MARK: - R2: Completion Closure

print("\n===== R2: COMPLETION CLOSURE =====")

func performOperation(completion: () -> Void) {
    print("Operation started")

    // Simulate an operation
    print("Operation completed")

    completion()
}

performOperation {
    print("Completion closure executed")
}


// MARK: - R3: Trailing Closure and Shorthand Arguments

print("\n===== R3: CLOSURE SYNTAX =====")

let numbers = [5, 2, 8, 1, 9]

// Trailing closure with explicit parameter names
let descending = numbers.sorted { first, second in
    first > second
}

print("Explicit closure names:", descending)

// Shorthand argument names
let ascending = numbers.sorted {
    $0 < $1
}

print("Shorthand argument names:", ascending)

// Trailing closure syntax
let doubled = numbers.map { $0 * 2 }

print("Doubled numbers:", doubled)


// MARK: - R4: Counter Closure

print("\n===== R4: COUNTER CLOSURE =====")

func makeCounter() -> () -> Int {
    var count = 0

    return {
        count += 1
        return count
    }
}

let counter = makeCounter()

print("Counter:", counter())
print("Counter:", counter())
print("Counter:", counter())

// Captured state:
// The closure remembers the count variable
// even after makeCounter() has finished executing.


// MARK: - R5: Avoid Retain Cycles

print("\n===== R5: WEAK SELF =====")

class TaskManager {
    var taskName = "Swift Closure Task"

    var completion: (() -> Void)?

    func setupCompletion() {
        completion = { [weak self] in
            guard let self = self else {
                print("TaskManager no longer exists")
                return
            }

            print("Completed:", self.taskName)
        }
    }

    deinit {
        print("TaskManager deallocated")
    }
}

var taskManager: TaskManager? = TaskManager()

taskManager?.setupCompletion()
taskManager?.completion?()

// weak self avoids a strong reference cycle
taskManager = nil
