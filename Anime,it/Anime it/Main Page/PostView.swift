//
//  PostView.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import SwiftUI
import Foundation

struct CreatePostView: View {
    @EnvironmentObject var auth: AuthManager
    @EnvironmentObject var feed: FeedManager

    @State private var caption = ""
    @State private var imageData: Data?

    var body: some View {
        VStack(spacing: 20) {
            TextField("What's on your mind?", text: $caption)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Post") {
                if let user = auth.currentUser {
                    feed.addPost(from: user, caption: caption, imageData: imageData)
                    caption = ""
                    imageData = nil
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    let auth = AuthManager()
    auth.currentUser = User(username: "testuser", fullname: "Test User")
    auth.isLoggedIn = true

    return CreatePostView()
        .environmentObject(auth)
        .environmentObject(FeedManager())
}
