import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Detail Screen")
                .font(.largeTitle)
                .bold()

            Text("Observe view lifecycle events.")

            NavigationLink("Open Another Detail") {
                DetailView()
            }
        }
        .padding()
        .onAppear {
            print("DetailView appeared")
        }
        .onDisappear {
            print("DetailView disappeared")
        }
    }
}
