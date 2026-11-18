// R1 : Build a command-line Swift program or Playground that stores a student's name, roll number, marks in five subjects,…


import Foundation

let studentName: String = "Yash Khandelwal"
let rollNumber: Int = 101

var marks1: Double = 85
var marks2: Double = 72
var marks3: Double = 90
var marks4: Double = 65
var marks5: Double = 78
var attendance: Double = 85

print("Student Name:", studentName)
print("Roll Number:", rollNumber)
print("Marks:", marks1, marks2, marks3, marks4, marks5)
print("Attendance:", attendance, "%")


// R2:Calculate total, average, percentage, and pass/fail status using constants and variables with appropriate types.

let total = marks1 + marks2 + marks3 + marks4 + marks5
let average = total / 5.0
let percentage = (total / 500.0) * 100

let result = marks1 >= 33 && marks2 >= 33 && marks3 >= 33 && marks4 >= 33 && marks5 >= 33

print("Total Marks:", total)
print("Average:", average)
print("Percentage:", percentage, "%")

if result {
    print("Result: Pass")
} else {
    print("Result: Fail")
}


// R3: Demonstrate arithmetic, comparison, logical, compound-assignment, and nil-coalescing operators in separate

import Foundation

print("Addition:", 10 + 5)
print("Subtraction:", 10 - 5)
print("Multiplication:", 10 * 5)
print("Division:", 10 / 5)
print("Remainder:", 10 % 3)

print("Equal:", 10 == 10)
print("Not Equal:", 10 != 5)
print("Greater:", 10 > 5)
print("Less:", 5 < 10)

let a = true
let b = false

print("AND:", a && b)
print("OR:", a || b)
print("NOT:", !a)

var number = 10
number += 5
print("Add Assignment:", number)

number -= 2
print("Subtract Assignment:", number)

number *= 2
print("Multiply Assignment:", number)

var name: String? = nil
let finalName = name ?? "Guest"
print("Name:", finalName)


// R4 : Use if/else and switch to assign a grade and print a formatted result.

import Foundation

let percentage: Double = 85
var grade: String

if percentage >= 90 {
    grade = "A+"
} else if percentage >= 80 {
    grade = "A"
} else if percentage >= 70 {
    grade = "B"
} else if percentage >= 60 {
    grade = "C"
} else if percentage >= 33 {
    grade = "D"
} else {
    grade = "F"
}

switch grade {
case "A+", "A":
    print("Excellent Performance")
case "B", "C":
    print("Good Performance")
case "D":
    print("Pass")
default:
    print("Fail")
}

print("Percentage: \(percentage)%")
print("Grade: \(grade)")

// R5: Validate boundary values such as 0, 100, a failing mark, and an invalid attendance value.

import Foundation

func validateMarks(_ marks: Int) {
    if marks >= 0 && marks <= 100 {
        print("\(marks) is a valid mark")
    } else {
        print("\(marks) is an invalid mark")
    }
}

func validateAttendance(_ attendance: Double) {
    if attendance >= 0 && attendance <= 100 {
        print("\(attendance)% is valid attendance")
    } else {
        print("\(attendance)% is invalid attendance")
    }
}

validateMarks(0)
validateMarks(100)
validateMarks(20)
validateMarks(120)

validateAttendance(85)
validateAttendance(150)


