//
//  ContentView.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import SwiftUI

//User Model function
struct User: Identifiable {
    var id: String
    var username : String
    var displayname : String
    var bio: String
    var links: String
    var profileImageURL: String
    
    var isFollowing: Int
    var isFollower: Int
    var artworkCount: Int
        
}


