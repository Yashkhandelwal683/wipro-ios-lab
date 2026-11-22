import UIKit

// MARK: - Codable Model

struct Course: Codable {
    let id: Int
    let title: String
    let body: String
}

// MARK: - Main View Controller

class MainViewController: UIViewController {

    // Form Controls
    let nameField = UITextField()
    let emailField = UITextField()
    let courseSegment = UISegmentedControl(items: ["Swift", "UIKit", "SwiftUI"])
    let submitButton = UIButton(type: .system)
    let fetchButton = UIButton(type: .system)

    let statusLabel = UILabel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")

        title = "UIKit Lab"
        view.backgroundColor = .systemBackground

        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
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

    // MARK: - UI Setup

    func setupUI() {

        let heading = UILabel()
        heading.text = "Student Profile"
        heading.font = .boldSystemFont(ofSize: 28)

        nameField.placeholder = "Enter Name"
        nameField.borderStyle = .roundedRect

        emailField.placeholder = "Enter Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress

        courseSegment.selectedSegmentIndex = 0

        submitButton.setTitle("Submit Profile", for: .normal)
        submitButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        submitButton.backgroundColor = .systemBlue
        submitButton.tintColor = .white
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(
            self,
            action: #selector(validateForm),
            for: .touchUpInside
        )

        fetchButton.setTitle("Fetch Courses", for: .normal)
        fetchButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        fetchButton.backgroundColor = .systemGreen
        fetchButton.tintColor = .white
        fetchButton.layer.cornerRadius = 10
        fetchButton.addTarget(
            self,
            action: #selector(openCourses),
            for: .touchUpInside
        )

        statusLabel.text = "Enter your details"
        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [
            heading,
            nameField,
            emailField,
            courseSegment,
            submitButton,
            fetchButton,
            statusLabel
        ])

        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 30
            ),

            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 25
            ),

            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -25
            ),

            submitButton.heightAnchor.constraint(equalToConstant: 50),
            fetchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Form Validation

    @objc func validateForm() {

        guard let name = nameField.text,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {

            showAlert(message: "Please enter your name.")
            return
        }

        guard let email = emailField.text,
              email.contains("@"),
              email.contains(".") else {

            showAlert(message: "Please enter a valid email.")
            return
        }

        let course = courseSegment.titleForSegment(
            at: courseSegment.selectedSegmentIndex
        ) ?? ""

        statusLabel.text = """
        Profile Submitted!

        Name: \(name)
        Email: \(email)
        Course: \(course)
        """

        showAlert(message: "Profile submitted successfully!")
    }

    func showAlert(message: String) {

        let alert = UIAlertController(
            title: "Message",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }

    // MARK: - Navigation

    @objc func openCourses() {

        let listVC = CourseListViewController()

        navigationController?.pushViewController(
            listVC,
            animated: true
        )
    }
}

// MARK: - Course List View Controller

class CourseListViewController: UIViewController,
                                UITableViewDelegate,
                                UITableViewDataSource {

    let tableView = UITableView()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let statusLabel = UILabel()

    var courses: [Course] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        print("CourseList viewDidLoad")

        title = "Courses"
        view.backgroundColor = .systemBackground

        setupTable()
        fetchCourses()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("CourseList viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("CourseList viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("CourseList viewWillDisappear")
    }

    // MARK: - Table Setup

    func setupTable() {

        tableView.delegate = self
        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        view.addSubview(statusLabel)
        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),

            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),

            statusLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            statusLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),

            statusLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            statusLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }

    // MARK: - Fetch Data

    func fetchCourses() {

        statusLabel.text = "Loading courses..."
        activityIndicator.startAnimating()

        guard let url = URL(
            string: "https://jsonplaceholder.typicode.com/posts"
        ) else {

            showFailure("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) {
            data, response, error in

            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }

            if let error = error {

                DispatchQueue.main.async {
                    self.showFailure(error.localizedDescription)
                }

                return
            }

            guard let data = data else {

                DispatchQueue.main.async {
                    self.showFailure("No data received.")
                }

                return
            }

            do {

                let decodedCourses = try JSONDecoder().decode(
                    [Course].self,
                    from: data
                )

                DispatchQueue.main.async {

                    self.courses = decodedCourses

                    if self.courses.isEmpty {
                        self.showEmpty()
                    } else {
                        self.statusLabel.text = ""
                        self.tableView.reloadData()
                    }
                }

            } catch {

                DispatchQueue.main.async {
                    self.showFailure("JSON decoding failed.")
                }
            }

        }.resume()
    }

    // MARK: - States

    func showFailure(_ message: String) {

        statusLabel.text = "Error: \(message)\n\nTap back and retry."
        tableView.isHidden = true
    }

    func showEmpty() {

        statusLabel.text = "No courses found."
        tableView.isHidden = true
    }

    // MARK: - TableView

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        return courses.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = UITableViewCell(
            style: .subtitle,
            reuseIdentifier: "CourseCell"
        )

        let course = courses[indexPath.row]

        cell.textLabel?.text = course.title
        cell.detailTextLabel?.text = "Course ID: \(course.id)"

        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - Navigation to Detail

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        let selectedCourse = courses[indexPath.row]

        let detailVC = CourseDetailViewController()
        detailVC.course = selectedCourse

        navigationController?.pushViewController(
            detailVC,
            animated: true
        )

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Detail View Controller

class CourseDetailViewController: UIViewController {

    var course: Course?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Detail viewDidLoad")

        view.backgroundColor = .systemBackground
        title = "Course Details"

        setupUI()
    }

    func setupUI() {

        let titleLabel = UILabel()
        let descriptionLabel = UILabel()

        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0

        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0

        titleLabel.text = course?.title
        descriptionLabel.text = course?.body

        let stack = UIStackView(
            arrangedSubviews: [
                titleLabel,
                descriptionLabel
            ]
        )

        stack.axis = .vertical
        stack.spacing = 25
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([

            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 30
            ),

            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 25
            ),

            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -25
            )
        ])
    }
}

// MARK: - AppDelegate

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        print("Application launched")

        window = UIWindow(frame: UIScreen.main.bounds)

        let rootVC = MainViewController()
        let navigationController = UINavigationController(
            rootViewController: rootVC
        )

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

// MARK: - Application Entry Point

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(AppDelegate.self)
)
