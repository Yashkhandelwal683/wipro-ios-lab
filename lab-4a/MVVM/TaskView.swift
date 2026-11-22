import SwiftUI

struct MVVM_TaskView: View {
    @State private var viewModel = TaskViewModel()
    @State private var newTask = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Task List - MVVM")
                .font(.largeTitle)
                .bold()

            HStack {
                TextField("Enter task", text: $newTask)
                    .textFieldStyle(.roundedBorder)

                Button("Add") {
                    viewModel.addTask(title: newTask)
                    newTask = ""
                }
            }

            Picker("Filter", selection: $viewModel.filter) {
                Text("All").tag(TaskFilter.all)
                Text("Active").tag(TaskFilter.active)
                Text("Completed").tag(TaskFilter.completed)
            }
            .pickerStyle(.segmented)

            List {
                ForEach(viewModel.filteredTasks) { task in
                    HStack {
                        Button {
                            viewModel.toggleTask(id: task.id)
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
                            viewModel.deleteTask(id: task.id)
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
