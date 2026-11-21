
import Foundation

// MARK: - R1: Struct and Class

print("===== R1: STRUCT AND CLASS =====")

struct Course {
    var name: String
    var instructor: String
    var credits: Int
}

class CourseManager {
    var courses: [Course] = []

    func addCourse(_ course: Course) {
        courses.append(course)
    }

    func displayCourses() {
        for course in courses {
            print("Course:", course.name)
            print("Instructor:", course.instructor)
            print("Credits:", course.credits)
        }
    }
}

let swiftCourse = Course(
    name: "Swift",
    instructor: "Mr. Vishal",
    credits: 4
)

let manager = CourseManager()
manager.addCourse(swiftCourse)
manager.addCourse(
    Course(name: "iOS Development", instructor: "Mr. Vishal", credits: 5)
)

manager.displayCourses()


// MARK: - R2: Value and Reference Behaviour

print("\n===== R2: VALUE VS REFERENCE =====")

// Struct: Value type
var originalCourse = Course(
    name: "Swift",
    instructor: "Mr. Vishal",
    credits: 4
)

var copiedCourse = originalCourse
copiedCourse.name = "SwiftUI"

print("Original struct:", originalCourse.name)
print("Copied struct:", copiedCourse.name)

// Class: Reference type
class Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let student1 = Student(name: "Yash")
let student2 = student1

student2.name = "Rahul"

print("Student 1:", student1.name)
print("Student 2:", student2.name)


// MARK: - R3: Weak Ownership

print("\n===== R3: WEAK REFERENCES =====")

class Classroom {
    let roomName: String
    var teacher: Teacher?

    init(roomName: String) {
        self.roomName = roomName
    }

    deinit {
        print("Classroom deallocated:", roomName)
    }
}

class Teacher {
    let name: String
    weak var classroom: Classroom?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Teacher deallocated:", name)
    }
}

var classroom: Classroom? = Classroom(roomName: "Swift Lab")

var teacher: Teacher? = Teacher(name: "Mr. Vishal")

classroom?.teacher = teacher
teacher?.classroom = classroom

print("Teacher:", teacher?.name ?? "Unknown")
print("Classroom:", teacher?.classroom?.roomName ?? "Not assigned")

// Classroom strongly owns Teacher.
// Teacher weakly references Classroom.
classroom = nil
teacher = nil


// MARK: - R4: Reference Cycle and Closure Capture

print("\n===== R4: REFERENCE CYCLE =====")

class ClosureDemo {
    var name = "Closure Demo"
    var action: (() -> Void)?

    func createStrongCapture() {
        action = {
            print(self.name)
        }
    }

    func createWeakCapture() {
        action = { [weak self] in
            guard let self = self else {
                print("Object no longer exists")
                return
            }

            print(self.name)
        }
    }

    deinit {
        print("ClosureDemo deallocated")
    }
}

// Strong reference cycle demonstration
var strongDemo: ClosureDemo? = ClosureDemo()
strongDemo?.createStrongCapture()
strongDemo?.action?()

// Break the strong cycle manually
strongDemo?.action = nil
strongDemo = nil

// Weak capture avoids the strong reference cycle
var weakDemo: ClosureDemo? = ClosureDemo()
weakDemo?.createWeakCapture()
weakDemo?.action?()
weakDemo = nil


// MARK: - R5: Value Semantics, Reference Semantics and ARC

print("\n===== R5: MEMORY AND SEMANTICS =====")

print("Structs are value types.")
print("Classes are reference types.")
print("Struct copies maintain independent values.")
print("Class copies share the same instance.")
print("ARC manages class instance memory.")
print("Weak references do not increase the reference count.")
print("Capture lists can prevent closure reference cycles.")
