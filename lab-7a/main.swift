
import UIKit

// MARK: - AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ProfileViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

// MARK: - Profile ViewController

class ProfileViewController: UIViewController {

    // MARK: - UI Components

    private let nameField = UITextField()
    private let emailField = UITextField()
    private let courseField = UITextField()

    private let submitButton = UIButton(type: .system)

    private let titleLabel = UILabel()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
        setupKeyboardDismissal()
    }

    // MARK: - R1 & R4: UI Setup

    private func setupUI() {

        view.backgroundColor = .systemBackground

        titleLabel.text = "Student Profile"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center

        // Name Field
        nameField.placeholder = "Enter your name"
        nameField.borderStyle = .roundedRect
        nameField.autocapitalizationType = .words
        nameField.returnKeyType = .next
        nameField.accessibilityLabel = "Name"

        // Email Field
        emailField.placeholder = "Enter your email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.textContentType = .emailAddress
        emailField.returnKeyType = .next
        emailField.accessibilityLabel = "Email"

        // Course Field
        courseField.placeholder = "Enter your course"
        courseField.borderStyle = .roundedRect
        courseField.autocapitalizationType = .words
        courseField.returnKeyType = .done
        courseField.accessibilityLabel = "Course"

        // Submit Button
        submitButton.setTitle("Submit Profile", for: .normal)
        submitButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(
            self,
            action: #selector(submitProfile),
            for: .touchUpInside
        )
        submitButton.accessibilityLabel = "Submit Profile"

        view.addSubview(titleLabel)
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(courseField)
        view.addSubview(submitButton)
    }

    // MARK: - R2: Auto Layout

    private func setupLayout() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        courseField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            // Title
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 40
            ),

            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            // Name
            nameField.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 40
            ),

            nameField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 25
            ),

            nameField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -25
            ),

            nameField.heightAnchor.constraint(equalToConstant: 50),

            // Email
            emailField.topAnchor.constraint(
                equalTo: nameField.bottomAnchor,
                constant: 20
            ),

            emailField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 50),

            // Course
            courseField.topAnchor.constraint(
                equalTo: emailField.bottomAnchor,
                constant: 20
            ),

            courseField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            courseField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            courseField.heightAnchor.constraint(equalToConstant: 50),

            // Submit
            submitButton.topAnchor.constraint(
                equalTo: courseField.bottomAnchor,
                constant: 30
            ),

            submitButton.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

    // MARK: - R3: Validation

    @objc private func submitProfile() {

        let name = nameField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let email = emailField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let course = courseField.text?.trimmingCharacters(in: .whitespaces) ?? ""

        guard !name.isEmpty else {
            showAlert(message: "Please enter your name.")
            return
        }

        guard !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }

        guard email.contains("@"), email.contains(".") else {
            showAlert(message: "Please enter a valid email.")
            return
        }

        guard !course.isEmpty else {
            showAlert(message: "Please enter your course.")
            return
        }

        showAlert(
            message: """
            Profile Submitted Successfully!

            Name: \(name)
            Email: \(email)
            Course: \(course)
            """
        )
    }

    // MARK: - Alert

    private func showAlert(message: String) {

        let alert = UIAlertController(
            title: "Profile",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }

    // MARK: - R4: Keyboard Dismissal

    private func setupKeyboardDismissal() {

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )

        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
