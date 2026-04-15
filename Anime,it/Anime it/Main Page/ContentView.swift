

import SwiftUI

struct ContentView: View {
    @StateObject var user = User(
        username: "new_user",
        fullname: "Your Name"
    )

    var body: some View {
        LoginView(user: user)
    }
}
#Preview {
    ContentView()
}
