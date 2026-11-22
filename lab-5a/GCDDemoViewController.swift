import UIKit

class GCDDemoViewController: UIViewController {

    private let statusLabel = UILabel()
    private let startButton = UIButton(type: .system)
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {

        statusLabel.text = "Ready to start"
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 20)

        startButton.setTitle("Start Slow Operation", for: .normal)
        startButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        startButton.addTarget(
            self,
            action: #selector(startOperation),
            for: .touchUpInside
        )

        activityIndicator.hidesWhenStopped = true

        let stackView = UIStackView(
            arrangedSubviews: [statusLabel, activityIndicator, startButton]
        )

        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.alignment = .center

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func startOperation() {

        // Prevent duplicate submissions
        startButton.isEnabled = false
        activityIndicator.startAnimating()
        statusLabel.text = "Processing..."

        print("Button tapped on:", Thread.isMainThread ? "Main Thread" : "Background")

        // R2: Background work on global queue
        DispatchQueue.global(qos: .userInitiated).async {

            print("Background work started")

            // R1: Simulate slow work without blocking the main thread
            Thread.sleep(forTimeInterval: 3)

            let result = "Operation completed successfully!"

            // R2: UI updates on main queue
            DispatchQueue.main.async {

                self.statusLabel.text = result
                self.activityIndicator.stopAnimating()
                self.startButton.isEnabled = true

                print("UI updated on Main Thread:", Thread.isMainThread)
            }
        }
    }
}
