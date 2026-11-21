
import SwiftUI

struct SwiftUIExample: View {

    @State private var userName: String = ""
    @State private var result: String = "Your result will appear here"

    var body: some View {
        VStack(spacing: 20) {

            Text("SwiftUI Demo")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Enter your name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Show Result") {
                if userName.trimmingCharacters(in: .whitespaces).isEmpty {
                    result = "Please enter your name"
                } else {
                    result = "Hello, \(userName)!"
                }
            }
            .buttonStyle(.borderedProminent)

            Text(result)
                .font(.headline)
                .padding()
        }
        .padding()
    }
}

#Preview {
    SwiftUIExample()
}
