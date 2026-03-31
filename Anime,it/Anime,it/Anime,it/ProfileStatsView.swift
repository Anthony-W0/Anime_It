//
//  ProfileStatsView.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import SwiftUI

struct ProfileStatsView: View {
    var user: User
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("\(user.artworkCount)")
                Text("Artwork")
            }
            Spacer()
            
            VStack {
                Text("\(user.isFollower)")
                Text("Followers")
            }
            Spacer()
            VStack {
                Text("\(user.isFollowing)")
                Text("Following")
            }
            Spacer()
        }
        .padding(.vertical)
    }
}

