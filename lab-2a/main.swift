
import Foundation

// MARK: - R1: Functions

print("===== R1: FUNCTIONS =====")

// Calculate mean
func calculateMean(numbers: [Double]) -> Double? {
    guard !numbers.isEmpty else {
        return nil
    }

    return numbers.reduce(0, +) / Double(numbers.count)
}

// Find maximum
func findMaximum(numbers: [Int]) -> Int? {
    return numbers.max()
}

// Validate email-like input
func validateEmail(email: String) -> Bool {
    let components = email.split(separator: "@")

    guard components.count == 2 else {
        return false
    }

    guard !components[0].isEmpty,
          !components[1].isEmpty,
          components[1].contains(".") else {
        return false
    }

    return true
}

// Format display name
func formatDisplayName(name: String) -> String {
    return name
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .split(separator: " ")
        .map { $0.capitalized }
        .joined(separator: " ")
}

let numbers = [10.0, 20.0, 30.0, 40.0]

print("Mean:", calculateMean(numbers: numbers) ?? 0)
print("Maximum:", findMaximum(numbers: [10, 50, 30, 90]) ?? 0)
print("Email valid:", validateEmail(email: "yash@example.com"))
print("Formatted name:", formatDisplayName(name: "  yash khandelwal  "))


// MARK: - R2: Filter, Map and Reduce

print("\n===== R2: HIGHER-ORDER FUNCTIONS =====")

struct Transaction {
    let title: String
    let amount: Double
    let isExpense: Bool
}

let transactions = [
    Transaction(title: "Food", amount: 250, isExpense: true),
    Transaction(title: "Salary", amount: 5000, isExpense: false),
    Transaction(title: "Travel", amount: 400, isExpense: true),
    Transaction(title: "Shopping", amount: 1200, isExpense: true),
    Transaction(title: "Bonus", amount: 1000, isExpense: false)
]

// Filter expenses
let expenses = transactions.filter { $0.isExpense }

// Map expense amounts
let expenseAmounts = expenses.map { $0.amount }

// Reduce to calculate total
let totalExpenses = expenseAmounts.reduce(0, +)

print("Expense transactions:")

for expense in expenses {
    print(expense.title, "-", expense.amount)
}

print("Expense amounts:", expenseAmounts)
print("Total expenses:", totalExpenses)


// MARK: - R3: Sorting Students

print("\n===== R3: SORTING =====")

struct Student {
    let name: String
    let marks: Int
}

let students = [
    Student(name: "Rahul", marks: 85),
    Student(name: "Aman", marks: 90),
    Student(name: "Yash", marks: 90),
    Student(name: "Priya", marks: 78),
    Student(name: "Ankit", marks: 85)
]

// Sort by marks descending and name ascending for ties
let sortedStudents = students.sorted {
    if $0.marks != $1.marks {
        return $0.marks > $1.marks
    }

    return $0.name < $1.name
}

for student in sortedStudents {
    print(student.name, "-", student.marks)
}


// MARK: - R4: Loop vs Higher-Order Functions

print("\n===== R4: LOOP VS HIGHER-ORDER =====")

// Loop-based solution
var loopTotal = 0.0

for transaction in transactions {
    if transaction.isExpense {
        loopTotal += transaction.amount
    }
}

print("Loop-based total:", loopTotal)

// Higher-order function solution
let functionalTotal = transactions
    .filter { $0.isExpense }
    .map { $0.amount }
    .reduce(0, +)

print("Higher-order total:", functionalTotal)


// MARK: - R5: Parameter Labels and Return Types

print("\n===== R5: PARAMETER LABELS =====")

func greetUser(name: String) -> String {
    return "Hello, \(formatDisplayName(name: name))!"
}

func calculateTotal(amounts: [Double]) -> Double {
    return amounts.reduce(0, +)
}

print(greetUser(name: "yash khandelwal"))
print("Calculated total:", calculateTotal(amounts: [100, 200, 300]))
