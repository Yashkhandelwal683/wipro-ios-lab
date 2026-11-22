

import Foundation

// MARK: - R1: Unsafe Counter

// This class is intentionally unsafe for demonstration.
// @unchecked Sendable bypasses compiler safety checks.
final class UnsafeCounter: @unchecked Sendable {
    var count = 0

    func increment() {
        count += 1
    }
}

// MARK: - R2: Safe Counter using Actor

actor SafeCounter {
    private var count = 0

    func increment() {
        count += 1
    }

    func getValue() -> Int {
        return count
    }
}

// MARK: - R3: Sendable Example

struct Student: Sendable {
    let name: String
    let rollNumber: Int
}

// MARK: - Main Program

@main
struct ConcurrentCounterDemo {

    static func main() async {

        let totalTasks = 10_000

        // -----------------------------
        // R1: Observe unsafe concurrency
        // -----------------------------

        print("----- Unsafe Counter -----")

        let unsafeCounter = UnsafeCounter()

        DispatchQueue.concurrentPerform(iterations: totalTasks) { _ in
            unsafeCounter.increment()
        }

        print("Expected value: \(totalTasks)")
        print("Actual unsafe value: \(unsafeCounter.count)")
        print("The value may be incorrect because of a data race.")

        // -----------------------------
        // R2: Fix using an Actor
        // -----------------------------

        print("\n----- Safe Counter using Actor -----")

        let safeCounter = SafeCounter()

        await withTaskGroup(of: Void.self) { group in

            for _ in 0..<totalTasks {
                group.addTask {
                    await safeCounter.increment()
                }
            }
        }

        let finalValue = await safeCounter.getValue()

        print("Expected value: \(totalTasks)")
        print("Actual safe value: \(finalValue)")

        // -----------------------------
        // R3: Sendable demonstration
        // -----------------------------

        print("\n----- Sendable Example -----")

        let student = Student(name: "Yash", rollNumber: 101)

        let task = Task {
            print("Student Name: \(student.name)")
            print("Roll Number: \(student.rollNumber)")
        }

        await task.value

        // -----------------------------
        // R4: Compiler feedback
        // -----------------------------

        print("\n----- Compiler Feedback -----")

        print("""
        UnsafeCounter uses @unchecked Sendable intentionally.
        It bypasses compiler concurrency safety checks.
        SafeCounter uses an actor to protect shared mutable state.
        Student is a Sendable struct with immutable properties.
        """)

        print("\nProgram completed.")
    }
}
