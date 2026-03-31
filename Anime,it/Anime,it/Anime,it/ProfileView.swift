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
    var isCurrentUser: Bool = false
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if isCurrentUser {
                            Button(action: {
                                print("Add new artwork tapped")
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [5]))
                                        .frame(width: 140, height: 180)

                                    VStack {
                                        Image(systemName: "plus")
                                        Text("Add")
                                    }
                                    .foregroundColor(.gray)
                                }
                            }
                        }

                        ForEach(Array(portfolioImageURLs.enumerated()), id: \.offset) { _, urlString in
                            AsyncImage(url: URL(string: urlString)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 140, height: 180)
                            .clipped()
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
                
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
