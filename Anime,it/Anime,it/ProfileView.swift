import SwiftUI

struct ProfileView: View {
    var user: User
    
    // Featured image(s) UNDER bio
    var featuredImageNames: [String] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // MARK: - Header + Bio
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Profile header
                    BioSectionView(user: user)
                    
                    
                    
                    // Edit Profile button
                    Button("Edit Profile") 
                    {
                        // Action here
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color(hex: "#a5d4d9"))
                    .cornerRadius(8)
                    
                    // Featured / bio images
                    if !featuredImageNames.isEmpty {
                        VStack(spacing: 16) {
                            ForEach(featuredImageNames, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding()
                .background(Color(hex: "#c4f0f5"))
                .cornerRadius(12)
                .padding(.horizontal)
            }
            .padding(.top)
        }
    }
}

