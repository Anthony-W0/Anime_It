

import SwiftUI

struct ContentView: View {
    @StateObject var auth = AuthManager()
    @StateObject var feed = FeedManager()
    
    var body: some View {
        if auth.isLoggedIn {
            ProfileView()
                .environmentObject(auth)
                .environmentObject(feed)
        } else {
            LoginView(auth: AuthManager())
                .environmentObject(auth)
        }
    }
}
#Preview {
    ContentView()
}
