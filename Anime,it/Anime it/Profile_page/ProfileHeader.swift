
//
//  ProfileHeader.swift
//  Anime it
//
//  Created by Anthony Whitmore

import SwiftUI

struct ProfileHeader: View {
    @ObservedObject var user: User

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)

            Text(user.fullname)

            TextField("Enter bio...", text: $user.bio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
