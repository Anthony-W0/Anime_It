import SwiftUI

struct ProfileView: View {
    @ObservedObject var user: User

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(user: user)

                ProfileStatsView(postCount: user.posts.count)

                PostGridView(posts: user.posts)

                Button(action: {
                    user.posts.append(Post(imageName: "photo"))
                }) {
                    Text("Add Post")
            
                }
            }
        }
        .navigationTitle(user.username)
    }
}
