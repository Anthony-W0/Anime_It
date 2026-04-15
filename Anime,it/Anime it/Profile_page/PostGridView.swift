//
//  PostGridView.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/9/26.
//

import SwiftUI

struct PostGridView: View {
    let posts: [Post]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(posts) { post in
                Image(systemName: post.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .padding()
    }
}

#Preview {
    PostGridView(posts: [
        Post(imageName: "photo"),
        Post(imageName: "photo"),
        Post(imageName: "photo")
    ])
}
