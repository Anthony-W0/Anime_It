//
//  ProfileHeader.swift
//  Anime it
//
//  Created by Anthony Whitmore

import SwiftUI

struct ProfileHeader: View {
    let user: User
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.profileImage)) 
            { image in
                 image
                     .resizable()
                     .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
                    

            Text(user.username)
                .font(.headline)
            Text("user.bio")
                .font(.subheadline)
        }
    }
   
}

