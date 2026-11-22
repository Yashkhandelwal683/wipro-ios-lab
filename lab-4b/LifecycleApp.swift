import SwiftUI

@main
struct LifecycleApp: App {
    @Environment(\.scenePhase) private var scenePhase

    init() {
        print("App initialized")
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .active:
                print("Scene became ACTIVE")

            case .inactive:
                print("Scene became INACTIVE")

            case .background:
                print("Scene entered BACKGROUND")

            @unknown default:
                print("Unknown scene phase")
            }
        }
    }
}
