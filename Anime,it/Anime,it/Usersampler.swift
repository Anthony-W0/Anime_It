//
//  Usersampler.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import SwiftUI
import UIKit

//
//  Sampler.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/1/26.
//

import SwiftUI
import UIKit

#Preview {
    let sampleUser = User(
        id: "1",
        username: "zephina",
        displayname: "Zephina",
        bio: "Anime artist 🎨",
        links: "https://google.com",
        profileImageName: "Profile", // asset name
        artworkImageName: "Artwork_zephina",  // asset name
        isFollowing: 23,
        isFollower: 54,
        artworkCount: 12
    )
    
    return ProfileView(
        user: sampleUser,
        featuredImageNames: ["Zephina pics", "Zephina pic 2", "Zephina pic 3", "Zephina pic 4"] // assets
    )
}


