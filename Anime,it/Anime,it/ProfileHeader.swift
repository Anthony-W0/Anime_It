//
//  ProfileHeader.swift
//  Anime it
//
//  Created by Anthony Whitmore

import SwiftUI

struct BioSectionView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Profile Image + Name
            HStack(alignment: .top, spacing: 12) {
                
                Image(user.profileImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(user.displayname)
                        .font(.headline)
                    
                    Text("@\(user.username)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
            // Bio Text
            Text(user.bio)
                .font(.subheadline)
            
            // Link
            Link(destination: URL(string: user.links)!) {
                Text(user.links)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
            }
            
            // Stats Row
            HStack(spacing: 20) {
                VStack {
                    Text("\(user.artworkCount)")
                    Text("Art")
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
        }
        .padding()
    }
        
}

