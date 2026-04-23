//
//  FeedView.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import SwiftUI
import Foundation


struct FeedView: View {
    @EnvironmentObject var feed: FeedManager

    var body: some View {
        NavigationView {
            List(feed.posts) { post in
                VStack(alignment: .leading, spacing: 8) {

                    // 👤 Header (username + avatar)
                    HStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 40, height: 40)

                        Text("@\(post.username)")
                            .font(.headline)

                        Spacer()
                    }
                    .padding(.horizontal)

                    // 🖼 Image
                    if let data = post.imageData,
                       let uiImage = UIImage(data: data) {

                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipped()
                            .cornerRadius(10)

                    } else if let urlString = post.imageURL,
                              let url = URL(string: urlString) {

                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 250)
                        .clipped()
                        .cornerRadius(12)
                    }

                    // ❤️ Actions
                    HStack(spacing: 16) {
                        Image(systemName: "heart")
                        Image(systemName: "bubble.right")
                        Image(systemName: "paperplane")
                    }
                    .font(.title2)
                    .padding(.horizontal)

                    // ✍️ Caption
                    Text(post.caption)
                        .padding(.horizontal)

                }
                .padding(.vertical)
            }
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    FeedView()
        .environmentObject(MockData.auth)
        .environmentObject(FeedManager())
}
