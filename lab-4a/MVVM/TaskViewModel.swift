import Foundation
import SwiftUI

@Observable
class TaskViewModel {
    var tasks: [TaskItem] = []
    var filter: TaskFilter = .all

    var filteredTasks: [TaskItem] {
        switch filter {
        case .all:
            return tasks
        case .active:
            return tasks.filter { !$0.isCompleted }
        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }

    func addTask(title: String) {
        let cleanedTitle = title.trimmingCharacters(in: .whitespaces)

        guard !cleanedTitle.isEmpty else {
            return
        }

        tasks.append(TaskItem(title: cleanedTitle))
    }

    func toggleTask(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else {
            return
        }

        tasks[index].isCompleted.toggle()
    }

    func deleteTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }
}
