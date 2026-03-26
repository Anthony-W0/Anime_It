//
//  ProfileHeader.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import SwiftUI

struct ProfileHeader: View {
    var user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.profileImageURL)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.displayname)
                    .font(.title2)
                    .bold()
                Text("@\(user.username)")
                    .foregroundColor(.gray)
                Text(user.bio)
                    .font(.caption)
                    .lineLimit(2)
            }
            Spacer()
        }
        .padding()
    }
}

