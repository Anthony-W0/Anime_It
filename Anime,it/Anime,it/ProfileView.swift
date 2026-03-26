//
//  Untitled.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var user: User
    var portfolioImageURLs: [String] = []
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                ProfileHeader(user: user)
                
                ProfileStatsView(user: user)
                
                Button(action: {
                    // TODO: Handle edit profile action
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.accentColor.opacity(0.1))
                        .foregroundStyle(.tint)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Text("Portfolio")
                .font(.headline)
                .padding(.horizontal)
                .padding(.top)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(portfolioImageURLs.enumerated()), id: \.offset) { _, urlString in
                    AsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView(user: samplerUser)
}
