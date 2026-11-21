
import Foundation

// MARK: - Student Marks Database

let studentMarks: [Int: Int] = [
    101: 95,
    102: 82,
    103: 76,
    104: 90
]

// MARK: - R1: Function returning an optional result

print("===== R1: OPTIONAL LOOKUP =====")

func getMarks(for studentID: Int) -> Int? {
    return studentMarks[studentID]
}

let searchedID = 101

if let marks = getMarks(for: searchedID) {
    print("Student ID:", searchedID)
    print("Marks:", marks)
} else {
    print("Student not found")
}


// MARK: - R2: if let, guard let, optional chaining, nil coalescing

print("\n===== R2: OPTIONAL HANDLING =====")

// if let
if let marks = getMarks(for: 102) {
    print("if let: Student marks =", marks)
}

// guard let
func displayStudentMarks(studentID: Int) {
    guard let marks = getMarks(for: studentID) else {
        print("guard let: Student not found")
        return
    }

    print("guard let: Marks =", marks)
}

displayStudentMarks(studentID: 103)
displayStudentMarks(studentID: 999)

// Optional chaining
let studentName: String? = "Yash"

print("Optional chaining:", studentName?.uppercased() ?? "No name")

// Nil coalescing
let optionalMarks = getMarks(for: 999)
let finalMarks = optionalMarks ?? 0

print("Nil coalescing result:", finalMarks)


// MARK: - R3: Missing Dictionary Key and Empty Text

print("\n===== R3: SAFE HANDLING =====")

// Missing dictionary key
let missingID = 500

if let marks = studentMarks[missingID] {
    print("Marks:", marks)
} else {
    print("Missing key: No student exists with ID", missingID)
}

// Empty text field
func processText(_ text: String) {
    guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        print("Empty text: Please enter valid text")
        return
    }

    print("Valid text:", text)
}

processText("")
processText("Swift Optionals")


// MARK: - R4: Avoid Force Unwrapping

print("\n===== R4: SAFE CODE =====")

// Dictionary lookups are handled using optional binding.
// No force unwrap operator (!) is used.

let safeLookup = studentMarks[101]

if let result = safeLookup {
    print("Safe lookup:", result)
} else {
    print("Safe lookup failed")
}

print("All optional values are handled safely.")
