//
//  MainTabView.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Label("Feed", systemImage: "house") }

            CreatePostView()
                .tabItem { Label("Post", systemImage: "plus.square") }

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}
