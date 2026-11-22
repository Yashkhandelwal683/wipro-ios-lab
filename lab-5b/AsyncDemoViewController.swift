import UIKit

class AsyncDemoViewController: UIViewController {

    private let statusLabel = UILabel()
    private let fetchButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    private var fetchTask: Task<Void, Never>?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {

        statusLabel.text = "Ready to fetch courses"
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0
        statusLabel.font = .systemFont(ofSize: 18)

        fetchButton.setTitle("Fetch Courses", for: .normal)
        fetchButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        fetchButton.addTarget(
            self,
            action: #selector(fetchButtonTapped),
            for: .touchUpInside
        )

        cancelButton.setTitle("Cancel Request", for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        cancelButton.addTarget(
            self,
            action: #selector(cancelButtonTapped),
            for: .touchUpInside
        )

        activityIndicator.hidesWhenStopped = true

        let stackView = UIStackView(
            arrangedSubviews: [
                statusLabel,
                activityIndicator,
                fetchButton,
                cancelButton
            ]
        )

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        cancelButton.isEnabled = false
    }

    @objc private func fetchButtonTapped() {

        fetchTask?.cancel()

        statusLabel.text = "Loading courses..."
        activityIndicator.startAnimating()

        fetchButton.isEnabled = false
        cancelButton.isEnabled = true

        // R2: Create and execute a Task
        fetchTask = Task {

            do {
                let courses = try await fetchCourses()

                // Check cancellation
                try Task.checkCancellation()

                if courses.isEmpty {
                    updateUI(message: "No courses found.")
                } else {
                    updateUI(message: "Courses:\n" + courses.joined(separator: "\n"))
                }

            } catch is CancellationError {

                updateUI(message: "Request cancelled.")

            } catch {

                updateUI(message: "Failed: \(error.localizedDescription)")
            }
        }
    }

    // R1: Async function simulating fetching data
    func fetchCourses() async throws -> [String] {

        try await Task.sleep(for: .seconds(3))

        try Task.checkCancellation()

        return [
            "Swift",
            "UIKit",
            "SwiftUI",
            "Concurrency"
        ]
    }

    // R3: Update UI according to result
    @MainActor
    private func updateUI(message: String) {

        statusLabel.text = message

        activityIndicator.stopAnimating()
        fetchButton.isEnabled = true
        cancelButton.isEnabled = false

        fetchTask = nil
    }

    @objc private func cancelButtonTapped() {

        fetchTask?.cancel()

        statusLabel.text = "Cancelling..."
    }
}
