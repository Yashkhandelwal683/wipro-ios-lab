import SwiftUI

struct MVC_TaskView: View {
    @State private var controller = TaskController()
    @State private var newTask = ""
    @State private var filter: TaskFilter = .all

    var body: some View {
        VStack(spacing: 20) {
            Text("Task List - MVC")
                .font(.largeTitle)
                .bold()

            HStack {
                TextField("Enter task", text: $newTask)
                    .textFieldStyle(.roundedBorder)

                Button("Add") {
                    controller.addTask(title: newTask)
                    newTask = ""
                }
            }

            Picker("Filter", selection: $filter) {
                Text("All").tag(TaskFilter.all)
                Text("Active").tag(TaskFilter.active)
                Text("Completed").tag(TaskFilter.completed)
            }
            .pickerStyle(.segmented)

            List {
                ForEach(controller.filteredTasks(filter: filter)) { task in
                    HStack {
                        Button {
                            controller.completeTask(id: task.id)
                        } label: {
                            Image(systemName:
                                task.isCompleted
                                ? "checkmark.circle.fill"
                                : "circle"
                            )
                        }

                        Text(task.title)
                            .strikethrough(task.isCompleted)

                        Spacer()

                        Button(role: .destructive) {
                            controller.deleteTask(id: task.id)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
        }
        .padding()
    }
}
