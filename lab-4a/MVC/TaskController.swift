import Foundation

class TaskController {
    private(set) var tasks: [TaskItem] = []

    func addTask(title: String) {
        let cleanedTitle = title.trimmingCharacters(in: .whitespaces)

        guard !cleanedTitle.isEmpty else {
            return
        }

        tasks.append(TaskItem(title: cleanedTitle))
    }

    func completeTask(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }

        tasks[index].isCompleted.toggle()
    }

    func deleteTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }

    func filteredTasks(filter: TaskFilter) -> [TaskItem] {
        switch filter {
        case .all:
            return tasks
        case .active:
            return tasks.filter { !$0.isCompleted }
        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }
}

enum TaskFilter {
    case all
    case active
    case completed
}
