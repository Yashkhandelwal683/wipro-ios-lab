
import UIKit

class UIKitExampleViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UIKit Demo"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Your result will appear here"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let showButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Result", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupLayout()

        showButton.addTarget(
            self,
            action: #selector(showResult),
            for: .touchUpInside
        )
    }

    private func setupLayout() {

        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                nameTextField,
                showButton,
                resultLabel
            ]
        )

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 30
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -30
            )
        ])
    }

    @objc private func showResult() {

        let name = nameTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        if name.isEmpty {
            resultLabel.text = "Please enter your name"
        } else {
            resultLabel.text = "Hello, \(name)!"
        }
    }
}
