//
//  ContentView.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import Combine

class User: ObservableObject {
    // If you have multiple `Post` types, disambiguate here by qualifying the module of the intended one.
    // For example, if your app target module is `Anime_it`, set the alias to `Anime_it.Post`.
    // Update the right-hand side to the correct module-qualified type if needed.
    typealias UserPost = Post

    // Publisher for manual change notifications if needed by legacy code
    private(set) var objectWillChange = ObservableObjectPublisher()

    @Published var username: String
    @Published var fullname: String
    @Published var bio: String
    @Published var posts: [UserPost]

    init(username: String, fullname: String, bio: String = "", posts: [UserPost] = []) {
        self.username = username
        self.fullname = fullname
        self.bio = bio
        self.posts = posts
    }
}
