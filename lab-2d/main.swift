
import Foundation

// MARK: - R1: Validation Error Enum

print("===== R1: VALIDATION ERROR =====")

enum ValidationError: Error {
    case emptyName
    case invalidMarks
    case invalidID
}


// MARK: - R2: Student Registration Function

print("\n===== R2: STUDENT REGISTRATION =====")

struct RegisteredStudent {
    let id: Int
    let name: String
    let marks: Int
}

func registerStudent(id: Int, name: String, marks: Int) throws -> RegisteredStudent {

    // Validate name
    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        throw ValidationError.emptyName
    }

    // Validate ID
    guard id > 0 else {
        throw ValidationError.invalidID
    }

    // Validate marks
    guard marks >= 0 && marks <= 100 else {
        throw ValidationError.invalidMarks
    }

    return RegisteredStudent(id: id, name: name, marks: marks)
}


// MARK: - R3: do-catch Error Handling

print("\n===== R3: DO CATCH =====")

func testRegistration(id: Int, name: String, marks: Int) {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            marks: marks
        )

        print("Registration successful!")
        print("ID:", student.id)
        print("Name:", student.name)
        print("Marks:", student.marks)

    } catch ValidationError.emptyName {
        print("Error: Student name cannot be empty.")

    } catch ValidationError.invalidID {
        print("Error: Student ID must be greater than zero.")

    } catch ValidationError.invalidMarks {
        print("Error: Marks must be between 0 and 100.")

    } catch {
        print("Unexpected error:", error)
    }
}

testRegistration(id: 101, name: "Yash", marks: 95)
testRegistration(id: 102, name: "", marks: 80)
testRegistration(id: -1, name: "Aman", marks: 85)
testRegistration(id: 103, name: "Rahul", marks: 150)


// MARK: - R4: throws, Optional and Result

print("\n===== R4: THROWS VS OPTIONAL VS RESULT =====")

// Optional: Returns value or nil
func findStudentName(id: Int) -> String? {
    if id == 101 {
        return "Yash"
    }

    return nil
}

print("Optional result:", findStudentName(id: 101) ?? "Not found")
print("Optional result:", findStudentName(id: 999) ?? "Not found")

// throws: Throws an error when something goes wrong
do {
    let student = try registerStudent(id: 201, name: "Priya", marks: 90)
    print("Throws example:", student.name)
} catch {
    print("Throws example failed:", error)
}

// Result: Stores success or failure
func registrationResult(id: Int, name: String, marks: Int)
    -> Result<RegisteredStudent, ValidationError> {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            marks: marks
        )

        return .success(student)

    } catch let error as ValidationError {
        return .failure(error)

    } catch {
        return .failure(.invalidID)
    }
}

let result = registrationResult(id: 301, name: "Unnati", marks: 88)

switch result {
case .success(let student):
    print("Result success:", student.name)

case .failure(let error):
    switch error {
    case .emptyName:
        print("Result error: Empty name")
    case .invalidMarks:
        print("Result error: Invalid marks")
    case .invalidID:
        print("Result error: Invalid ID")
    }
}


// MARK: - R5: Graceful Invalid Input Handling

print("\n===== R5: SAFE INPUT HANDLING =====")

// Invalid inputs are tested using do-catch.
// No force try or forced unwrap is used.
// Expected validation errors are handled gracefully.

testRegistration(id: 0, name: "Student", marks: 50)
testRegistration(id: 401, name: "Valid Student", marks: 100)

print("Program completed without crashing.")
