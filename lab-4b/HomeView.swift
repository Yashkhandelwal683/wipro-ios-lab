import SwiftUI

struct HomeView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var refreshCount = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Lifecycle Demo")
                    .font(.largeTitle)
                    .bold()

                Text("Home Screen")
                    .font(.title2)

                Text("Refresh count: \(refreshCount)")
                    .font(.headline)

                NavigationLink("Open Detail Screen") {
                    DetailView()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .onAppear {
                print("HomeView appeared")
            }
            .onDisappear {
                print("HomeView disappeared")
            }
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == .active {
                    refreshData()
                }
            }
        }
    }

    private func refreshData() {
        refreshCount += 1
        print("Home screen refreshed. Count: \(refreshCount)")
    }
}
