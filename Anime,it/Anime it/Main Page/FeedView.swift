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
                VStack(alignment: .leading) {
                    
                    Text("@\(post.username)")
                        .font(.headline)
                    
                    if let data = post.imageData,
                       let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    }

                    Text(post.caption)
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
