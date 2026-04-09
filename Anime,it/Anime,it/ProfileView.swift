import SwiftUI

struct ProfileView: View {
   
   @StateObject var vm = UserViewModel()
   @Stste private var selectedUser: User?
   
   var body: some View {
      NavigationView {
          ScrollView(.horizontal, showsIndicators: false) {
             VStack(spacing: 16) {
                                  ForEach(vm.users) { user in
                                                     VStack {
                                AsyncImage(url: URL(string: user.profileImage)) { image in
                                    image.resizable().scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(
                                            selectedUser?.id == user.id ? Color.blue : Color.gray,
                                            lineWidth: 2
                                        )
                                )
                                
                                Text(user.username)
                                    .font(.caption)
                            }
                            .onTapGesture {
                                selectedUser = user   // 👈 switch profile
                            }
                        }
                    }
                    .padding()
                }
                
                Divider()
                
                // 👤 Selected Profile
                if let user = selectedUser {
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            
                            ProfileHeader(user: user)
                            ProfileStatsView(user: user)
                            
                            Text("Posts coming soon...")
                                .padding()
                        }
                    }
                    
                } else {
                    Text("Select a user")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            vm.fetchUsers()
        }
        .onChange(of: vm.users) {
            // 👇 Auto-select first user when data loads
            if selectedUser == nil {
                selectedUser = vm.users.first
            }
        }
    }
}

#Preview {
    ProfileView()
}

                                                    

