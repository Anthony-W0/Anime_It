

import SwiftUI

struct ContentView: View {
    @StateObject var auth = AuthManager()
    @StateObject var feed = FeedManager()
    
    var body: some View {
        if auth.isLoggedIn {
            MainTabView()
                .environmentObject(auth)
                .environmentObject(feed)
        } else {
            LoginView()
                .environmentObject(auth)
        }
        
    }
    
}
#Preview {
    ContentView()
}
