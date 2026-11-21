

import Foundation

// MARK: - R1: Array of Course Names

print("===== R1: ARRAY =====")

var courses = ["Swift", "Java", "Python", "JavaScript"]

// Add a course
courses.append("Kotlin")
print("After adding:", courses)

// Remove a course
courses.remove(at: 1)
print("After removing:", courses)

// Sort courses
courses.sort()
print("Sorted courses:", courses)

// Filter courses containing the letter 'S'
let filteredCourses = courses.filter {
    $0.contains("S")
}
print("Filtered courses:", filteredCourses)

// Search for a course
if let foundCourse = courses.first(where: { $0 == "Swift" }) {
    print("Course found:", foundCourse)
} else {
    print("Course not found")
}


// MARK: - R2: Set of Student IDs

print("\n===== R2: SET =====")

let studentIDs = [101, 102, 103, 101, 104, 102, 105]

let uniqueStudentIDs = Set(studentIDs)

print("Original IDs:", studentIDs)
print("Unique IDs:", uniqueStudentIDs.sorted())
print("Unique student count:", uniqueStudentIDs.count)


// MARK: - R3: Dictionary of Student Marks

print("\n===== R3: DICTIONARY =====")

var studentMarks: [String: Int] = [
    "Yash": 95,
    "Aman": 78,
    "Rahul": 65,
    "Unnati": 88,
    "Priya": 55
]

// Find topper
if let topper = studentMarks.max(by: { $0.value < $1.value }) {
    print("Topper:", topper.key)
    print("Highest marks:", topper.value)
}

// Students below threshold
let threshold = 75

let belowThreshold = studentMarks.filter {
    $0.value < threshold
}

print("Students below", threshold, "marks:")

for (name, marks) in belowThreshold.sorted(by: { $0.value < $1.value }) {
    print(name, "-", marks)
}


// MARK: - R4: Enum and Switch

print("\n===== R4: ENUM =====")

enum TaskPriority {
    case low
    case medium
    case high
    case urgent
}

let priority: TaskPriority = .high

switch priority {
case .low:
    print("Priority: Low - Can be done later")

case .medium:
    print("Priority: Medium - Normal task")

case .high:
    print("Priority: High - Complete soon")

case .urgent:
    print("Priority: Urgent - Complete immediately")
}


// MARK: - R5: When to Use Collections

print("\n===== R5: COLLECTIONS =====")

print("Array: Used when we need an ordered collection of elements.")
print("Set: Used when we need unique elements without duplicates.")
print("Dictionary: Used when we need key-value pairs.")
print("Enum: Used when we have a fixed set of possible values.")
