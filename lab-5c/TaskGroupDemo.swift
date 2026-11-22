import Foundation

struct Course: Sendable {
    let id: Int
    let name: String
}

enum FetchError: Error, Sendable {
    case courseNotFound(Int)
}

func fetchCourse(id: Int) async throws -> Course {

    // Simulate different network delays
    let delay = UInt64(id) * 1_000_000_000

    try await Task.sleep(for: .nanoseconds(delay))

    // Simulate one failing request
    if id == 3 {
        throw FetchError.courseNotFound(id)
    }

    try Task.checkCancellation()

    return Course(id: id, name: "Course \(id)")
}

// MARK: - Sequential Fetch

func fetchSequentially(ids: [Int]) async -> [Course] {

    var courses: [Course] = []

    for id in ids {
        do {
            let course = try await fetchCourse(id: id)
            courses.append(course)
            print("Sequential: fetched \(course.name)")
        } catch {
            print("Sequential: failed course \(id)")
        }
    }

    return courses
}

// MARK: - Concurrent Fetch using TaskGroup

func fetchConcurrently(ids: [Int]) async -> [Course] {

    await withTaskGroup(of: Result<Course, ErrorResult>.self) { group in

        for id in ids {

            group.addTask {
                do {
                    let course = try await fetchCourse(id: id)
                    return .success(course)
                } catch {
                    return .failure(ErrorResult(id: id))
                }
            }
        }

        var courses: [Course] = []

        for await result in group {

            switch result {
            case .success(let course):
                courses.append(course)
                print("Concurrent: fetched \(course.name)")

            case .failure(let error):
                print("Concurrent: failed course \(error.id)")
            }
        }

        return courses.sorted { $0.id < $1.id }
    }
}

// Wrapper to safely report failure information
struct ErrorResult: Sendable {
    let id: Int
}

// MARK: - Main Demo

@main
struct TaskGroupDemo {

    static func main() async {

        let courseIDs = [1, 2, 3, 4, 5]

        print("========== SEQUENTIAL FETCH ==========")

        let sequentialStart = Date()

        let sequentialCourses = await fetchSequentially(ids: courseIDs)

        let sequentialTime = Date().timeIntervalSince(sequentialStart)

        print("Sequential successful courses:", sequentialCourses.count)
        print("Sequential time:", sequentialTime, "seconds")

        print("\n========== CONCURRENT FETCH ==========")

        let concurrentStart = Date()

        let concurrentCourses = await fetchConcurrently(ids: courseIDs)

        let concurrentTime = Date().timeIntervalSince(concurrentStart)

        print("Concurrent successful courses:", concurrentCourses.count)
        print("Concurrent time:", concurrentTime, "seconds")

        print("\n========== COMPARISON ==========")

        print("Sequential:", sequentialTime, "seconds")
        print("Concurrent:", concurrentTime, "seconds")

        if concurrentTime < sequentialTime {
            print("Concurrent fetching was faster.")
        }

        print("\n========== CANCELLATION & LIFETIME ==========")
        print("""
        TaskGroup uses structured concurrency.
        Child tasks belong to the parent scope.
        Cancellation propagates to child tasks.
        The group waits for its child tasks to finish.
        """)
    }
}
