

//
//  FeedManager.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import Foundation
import SwiftUI
import Combine

class FeedManager: ObservableObject {
    @Published var posts: [Post] = []

    func addPost(from user: User, caption: String, imageData: Data?, imageURL: String?) {
        let newPost = Post(
            username: user.username,
            caption: caption,
            imageData: imageData,
            imageURL: imageURL
        )
        posts.insert(newPost, at: 0)
    }

    init() {
        posts = [
            Post(username: "john_doe", caption: "Chill vibes 🌊", imageData: nil, imageURL: "https://picsum.photos/400"),
            Post(username: "animefan", caption: "This is fire 🔥", imageData: nil, imageURL: "https://picsum.photos/401"),
            Post(username: "sarah", caption: "Sunset 🌅", imageData: nil, imageURL: "https://picsum.photos/402"),

            // 👇 10 MORE USERS
            Post(username: "mike23", caption: "Gym grind 💪", imageData: nil, imageURL: "https://picsum.photos/403"),
            Post(username: "lilyx", caption: "Coffee time ☕️", imageData: nil, imageURL: "https://picsum.photos/404"),
            Post(username: "traveler", caption: "New adventure ✈️", imageData: nil, imageURL: "https://picsum.photos/405"),
            Post(username: "foodie", caption: "Best burger ever 🍔", imageData: nil, imageURL: "https://picsum.photos/406"),
            Post(username: "gamer01", caption: "Late night session 🎮", imageData: nil, imageURL: "https://picsum.photos/407"),
            Post(username: "alex99", caption: "Weekend vibes 😎", imageData: nil, imageURL: "https://picsum.photos/408"),
            Post(username: "nina", caption: "Beach day 🏖", imageData: nil, imageURL: "https://picsum.photos/409"),
            Post(username: "devlife", caption: "Coding all day 💻", imageData: nil, imageURL: "https://picsum.photos/410"),
            Post(username: "musiclover", caption: "New playlist 🎧", imageData: nil, imageURL: "https://picsum.photos/411"),
            Post(username: "fitgirl", caption: "Morning run 🏃‍♀️", imageData: nil, imageURL: "https://picsum.photos/412")
        ]
    }
}


