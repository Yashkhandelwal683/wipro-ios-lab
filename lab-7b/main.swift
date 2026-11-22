
import UIKit

// MARK: - R1: Model

struct Student: Identifiable {
    let id: Int
    let name: String
    let course: String
    let description: String
}

// MARK: - App Entry Point

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.Key: Any]? = nil
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let listVC = StudentListViewController()
        let navigationController = UINavigationController(rootViewController: listVC)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

// MARK: - R1: List Screen

class StudentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()

    private let students = [
        Student(id: 1, name: "Yash", course: "iOS Development", description: "Learning Swift and UIKit."),
        Student(id: 2, name: "Rahul", course: "Computer Science", description: "Interested in app development."),
        Student(id: 3, name: "Priya", course: "Swift Programming", description: "Learning iOS UI development."),
        Student(id: 4, name: "Aman", course: "Mobile Development", description: "Building mobile applications."),
        Student(id: 5, name: "Anjali", course: "UIKit", description: "Exploring navigation and UI.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Students"
        view.backgroundColor = .systemBackground

        setupTableView()
    }

    // MARK: - TableView Setup

    private func setupTableView() {

        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "StudentCell"
        )

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - TableView DataSource

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        students.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "StudentCell",
            for: indexPath
        )

        let student = students[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = student.name
        content.secondaryText = student.course

        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - R2 & R3: Passing Object + Navigation

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        tableView.deselectRow(at: indexPath, animated: true)

        let selectedStudent = students[indexPath.row]

        let detailVC = StudentDetailViewController(student: selectedStudent)

        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - R1 & R2: Detail Screen

class StudentDetailViewController: UIViewController {

    private let student: Student

    private let nameLabel = UILabel()
    private let courseLabel = UILabel()
    private let descriptionLabel = UILabel()

    // Safely receive selected student

    init(student: Student) {
        self.student = student
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Student Details"
        view.backgroundColor = .systemBackground

        setupUI()
        setupLayout()
    }

    // MARK: - UI

    private func setupUI() {

        nameLabel.text = student.name
        nameLabel.font = .boldSystemFont(ofSize: 28)

        courseLabel.text = "Course: \(student.course)"
        courseLabel.font = .systemFont(ofSize: 20)

        descriptionLabel.text = student.description
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(courseLabel)
        view.addSubview(descriptionLabel)
    }

    // MARK: - Auto Layout

    private func setupLayout() {

        NSLayoutConstraint.activate([

            nameLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 30
            ),

            nameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            nameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            courseLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 20
            ),

            courseLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            courseLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            descriptionLabel.topAnchor.constraint(
                equalTo: courseLabel.bottomAnchor,
                constant: 20
            ),

            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
}
