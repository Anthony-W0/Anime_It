import SwiftUI

struct CreatePostView: View {
    @EnvironmentObject var auth: AuthManager
    @EnvironmentObject var feed: FeedManager

    @State private var caption = ""
    @State private var imageData: Data?

    var body: some View {
        VStack(spacing: 20) {

            // 🖼 Image preview
            if let imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
            } 

            // 📸 Image picker
            ImagePicker(imageData: $imageData)

            // ✍️ Caption
            TextField("Write a caption...", text: $caption)
                .textFieldStyle(.roundedBorder)
                .padding()

            // ➕ Post button
            Button("Post") {
                if let user = auth.currentUser {
                    feed.addPost(
                        from: user,
                        caption: caption,
                        imageData: imageData,
                        imageURL: nil
                    )
                    caption = ""
                    imageData = nil
                }
            }
            .disabled(caption.isEmpty || imageData == nil)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
