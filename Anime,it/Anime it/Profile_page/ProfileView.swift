import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: AuthManager
    @EnvironmentObject var feed: FeedManager
    @State private var tempImage: Data?
    
    var body: some View {
        VStack(spacing: 20) {
            if let user = auth.currentUser {
                
                if let imageData = user.profileImageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 100, height: 100)
                }
                
                ImagePicker(imageData: $tempImage)
                    .onChange(of: tempImage) { oldValue, newValue in
                        if let updatedUser = auth.currentUser,
                           let data = newValue {
                            updatedUser.profileImageData = data
                            auth.updateUser(updatedUser)
                        }
                    }
                        
                Text("@\(user.fullname)")
                    .font(.title)
                
                Text("@\(user.username)")
                    .foregroundColor(.gray)
                List {
                    ForEach(feed.posts.filter { $0.username == user.username }) { post in
                        VStack(alignment: .leading) {
                            
                            if let data = post.imageData,
                               let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                    .clipped()
                            }
                            
                            Text(post.caption)
                        }
                    }
                }
            }
        }
        
        Button("Logout") {
            auth.logout()
        }
        .foregroundColor(.red)
    }
}

#Preview {
    let auth = AuthManager()
    auth.currentUser = User(username: "testuser", fullname: "Test User")
    auth.isLoggedIn = true

    return ProfileView()
        .environmentObject(auth)
        .environmentObject(FeedManager())
}
