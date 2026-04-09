//
//  ProfileStatsView.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import SwiftUI

struct ProfileStatsView: View {
    let user: User
    
    var body: some View {
        HStack(Spacer: 20) {
            
            VStack {
                Text("\(user.posts)")
                Text("Posts")
            }
            
            
            VStack {
                Text("\(user.isFollower)")
                Text("Followers")
            }
            
            VStack {
                Text("\(user.isFollowing)")
                Text("Following")
            }
            
        }
        .padding(.vertical)
    }
}

