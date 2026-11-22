
import SwiftUI
import Foundation

// MARK: - R2: Codable Model

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

// MARK: - R5: Error Handling

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(Int)
    case emptyResults

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid server response"
        case .httpError(let code):
            return "HTTP Error: \(code)"
        case .emptyResults:
            return "No posts found"
        }
    }
}

// MARK: - R3: Networking

struct APIService {

    func fetchPosts() async throws -> [Post] {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpError(httpResponse.statusCode)
        }

        let posts = try JSONDecoder().decode([Post].self, from: data)

        guard !posts.isEmpty else {
            throw APIError.emptyResults
        }

        return posts
    }
}

// MARK: - R6: ViewModel

@MainActor
class PostViewModel: ObservableObject {

    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = APIService()

    func fetchPosts() {

        Task {

            isLoading = true
            errorMessage = nil

            do {
                posts = try await service.fetchPosts()
            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }
    }

    func retry() {
        fetchPosts()
    }
}

// MARK: - R4: List Screen

struct ContentView: View {

    @StateObject private var viewModel = PostViewModel()

    var body: some View {

        NavigationStack {

            Group {

                if viewModel.isLoading {

                    ProgressView("Loading posts...")

                } else if let error = viewModel.errorMessage {

                    VStack(spacing: 15) {

                        Text(error)
                            .multilineTextAlignment(.center)

                        Button("Retry") {
                            viewModel.retry()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()

                } else {

                    List(viewModel.posts) { post in

                        NavigationLink(destination: PostDetailView(post: post)) {

                            VStack(alignment: .leading, spacing: 8) {

                                Text(post.title)
                                    .font(.headline)

                                Text(post.body)
                                    .lineLimit(2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .task {
                viewModel.fetchPosts()
            }
        }
    }
}

// MARK: - R4: Detail Screen

struct PostDetailView: View {

    let post: Post

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                Text(post.title)
                    .font(.title)
                    .bold()

                Text(post.body)
                    .font(.body)

                Text("Post ID: \(post.id)")
                    .foregroundStyle(.secondary)

                Text("User ID: \(post.userId)")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - App Entry Point

@main
struct MainApp: App {

    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}
