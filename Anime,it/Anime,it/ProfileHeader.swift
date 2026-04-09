//
//  ProfileHeader.swift
//  Anime it
//
//  Created by Anthony Whitmore

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        VStack {
            Image("profile_picture")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())

            Text("Username")
                .font(.headline)
            Text("Bio goes here")
                .font(.subheadline)
        }
    }
   
}

