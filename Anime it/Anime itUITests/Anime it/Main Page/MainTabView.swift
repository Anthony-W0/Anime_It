//
//  MainTabView.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Label("Feed", systemImage: "house") }

            CreatePostView()
                .tabItem { Label("Post", systemImage: "plus.square") }

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
            
            
        }
        .background(Color(.systemGroupedBackground))
    }
    
}


