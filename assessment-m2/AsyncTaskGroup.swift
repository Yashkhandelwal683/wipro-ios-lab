
import SwiftUI

// MARK: - Model

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
}

// MARK: - R1: MVVM ViewModel

@MainActor
class TaskViewModel: ObservableObject {

    @Published var tasks: [TaskItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var resultMessage = ""

    private var fetchTask: Task<Void, Never>?

    // MARK: - R2: Fetch two independent sources concurrently

    func fetchData() async throws -> [String] {

        try await withThrowingTaskGroup(of: [String].self) { group in

            group.addTask {
                try await Task.sleep(for: .seconds(2))
                return ["Task from Source A", "Task from Source A2"]
            }

            group.addTask {
                try await Task.sleep(for: .seconds(3))
                return ["Task from Source B", "Task from Source B2"]
            }

            var combinedResults: [String] = []

            for try await result in group {
                combinedResults.append(contentsOf: result)
            }

            return combinedResults
        }
    }

    // MARK: - R3: Loading, Success, Error and Cancellation

    func loadTasks() {

        fetchTask?.cancel()

        fetchTask = Task {

            isLoading = true
            errorMessage = nil
            resultMessage = ""

            do {

                let fetchedData = try await fetchData()

                try Task.checkCancellation()

                tasks = fetchedData.map { TaskItem(title: $0) }

                resultMessage = "Data loaded successfully!"

            } catch is CancellationError {

                resultMessage = "Request cancelled."

            } catch {

                errorMessage = "Something went wrong while fetching data."

            }

            isLoading = false
        }
    }

    func cancelLoading() {
        fetchTask?.cancel()
    }

    // MARK: - Task List Operations

    func addTask() {
        tasks.append(TaskItem(title: "New Task \(tasks.count + 1)"))
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

// MARK: - R1: SwiftUI View

struct ContentView: View {

    @StateObject private var viewModel = TaskViewModel()

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Async Task Group Demo")
                    .font(.title2)
                    .fontWeight(.bold)

                // Loading State

                if viewModel.isLoading {

                    ProgressView("Fetching data...")
                        .padding()

                    Button("Cancel Request") {
                        viewModel.cancelLoading()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                } else {

                    Button("Fetch Tasks") {
                        viewModel.loadTasks()
                    }
                    .buttonStyle(.borderedProminent)
                }

                // Success State

                if !viewModel.resultMessage.isEmpty {
                    Text(viewModel.resultMessage)
                        .foregroundStyle(.green)
                }

                // Error State

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }

                List {
                    ForEach(viewModel.tasks) { task in
                        Text(task.title)
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }

                Button("Add Task") {
                    viewModel.addTask()
                }
                .buttonStyle(.bordered)

            }
            .padding()
            .navigationTitle("MVVM Tasks")
        }
    }
}

// MARK: - App Entry Point

@main
struct AsyncTaskGroupApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
