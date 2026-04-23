import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: AuthManager
    @EnvironmentObject var feed: FeedManager

    var body: some View {
        NavigationView {
            VStack {
                if let user = auth.currentUser {

                    // 👤 User Info
                    Text(user.fullname)
                        .font(.title)

                    Text("@\(user.username)")
                        .foregroundColor(.gray)

                    // ➕ Post Button
                    NavigationLink(
                        destination: CreatePostView()
                            .environmentObject(auth)
                            .environmentObject(feed)
                    ) {
                        Text("+ New Post")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    // 🖼 Grid
                    ScrollView {
                        let columns = [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]

                        LazyVGrid(columns: columns, spacing: 2) {
                            ForEach(feed.posts.filter { $0.username == user.username }) { post in
                                if let data = post.imageData,
                                   let uiImage = UIImage(data: data) {

                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 400)
                                        .clipped()

                                } else if let urlString = post.imageURL,
                                          let url = URL(string: urlString) {

                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(height: 400)
                                    .clipped()
                                }                            }
                        }
                    }

                    // 🚪 Logout
                    Button("Logout") {
                        auth.logout()
                    }
                    .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}
