//
//  Results.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/15/26.
//


import Foundation

struct Results: Codable {
    let title: String
    let body: String
    
}

struct Posts: Decodable, Identifiable {
    let username: String
    let bio: Int
    let profileImageURL: String?
    let Follower: Int
    let Following: Int
    let post: Int
    let id: Int
}
