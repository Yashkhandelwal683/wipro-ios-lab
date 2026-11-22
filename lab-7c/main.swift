import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Controls

    let nameField = UITextField()
    let subscribeSwitch = UISwitch()
    let courseSegment = UISegmentedControl(items: ["Swift", "UIKit", "SwiftUI"])
    let experienceSlider = UISlider()
    let datePicker = UIDatePicker()
    let submitButton = UIButton(type: .system)
    let summaryLabel = UILabel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")

        view.backgroundColor = .systemBackground
        setupUI()
        setupKeyboard()
        updateSummary()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        updateSummary()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    // MARK: - UI

    func setupUI() {

        let titleLabel = UILabel()
        titleLabel.text = "User Profile"
        titleLabel.font = .boldSystemFont(ofSize: 28)

        nameField.placeholder = "Enter your name"
        nameField.borderStyle = .roundedRect
        nameField.addTarget(self, action: #selector(controlsChanged),
                            for: .editingChanged)

        courseSegment.selectedSegmentIndex = 0
        courseSegment.addTarget(self, action: #selector(controlsChanged),
                                for: .valueChanged)

        experienceSlider.minimumValue = 0
        experienceSlider.maximumValue = 10
        experienceSlider.addTarget(self, action: #selector(controlsChanged),
                                   for: .valueChanged)

        subscribeSwitch.addTarget(self, action: #selector(controlsChanged),
                                  for: .valueChanged)

        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(controlsChanged),
                             for: .valueChanged)

        submitButton.setTitle("Submit Profile", for: .normal)
        submitButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        submitButton.addTarget(self, action: #selector(submitProfile),
                               for: .touchUpInside)

        summaryLabel.numberOfLines = 0
        summaryLabel.font = .systemFont(ofSize: 16)
        summaryLabel.backgroundColor = .secondarySystemBackground

        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            nameField,
            courseSegment,
            experienceSlider,
            subscribeSwitch,
            datePicker,
            submitButton,
            summaryLabel
        ])

        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
    }

    // MARK: - Summary

    @objc func controlsChanged() {
        updateSummary()
    }

    func updateSummary() {

        let name = nameField.text?.isEmpty == false
            ? nameField.text!
            : "Not entered"

        let course = courseSegment.titleForSegment(
            at: courseSegment.selectedSegmentIndex
        ) ?? "None"

        let experience = Int(experienceSlider.value)

        let subscription = subscribeSwitch.isOn
            ? "Subscribed"
            : "Not Subscribed"

        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        let date = formatter.string(from: datePicker.date)

        summaryLabel.text = """
        PROFILE SUMMARY

        Name: \(name)
        Course: \(course)
        Experience: \(experience) years
        Subscription: \(subscription)
        Date: \(date)
        """
    }

    // MARK: - Submit

    @objc func submitProfile() {

        if nameField.text?.trimmingCharacters(
            in: .whitespaces
        ).isEmpty == true {

            let alert = UIAlertController(
                title: "Missing Name",
                message: "Please enter your name.",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(title: "OK", style: .default)
            )

            present(alert, animated: true)

        } else {

            let alert = UIAlertController(
                title: "Success",
                message: "Profile submitted successfully!",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(title: "OK", style: .default)
            )

            present(alert, animated: true)
        }
    }

    // MARK: - Keyboard

    func setupKeyboard() {

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )

        view.addGestureRecognizer(tapGesture)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: Notification) {
        print("Keyboard appeared")
    }

    @objc func keyboardWillHide(notification: Notification) {
        print("Keyboard dismissed")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        print("ProfileViewController deallocated")
    }
}

// MARK: - Run Application

let window = UIWindow(frame: UIScreen.main.bounds)
window.rootViewController = ProfileViewController()
window.makeKeyAndVisible()
