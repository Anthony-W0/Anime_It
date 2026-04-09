import SwiftUI

struct ProfileView: View {
   
   @StateObject var vm = UserViewModel()
   
   var body: some View {
      NavigationView {
          ScrollView {
             VStack(spacing: 20) {
                                  ForEach(vm.users) { user in

                                                     Vstack(spacing:12) {
                                                        ProfileHeader(user: user)
                                                        ProfileStatsView(user: user)

                                                        Divider()
                                                     }
                                                     .padding()
                                                    }
             }
          }
         .navigationTitle("Profiles")
      }
      .onAppear {
         .vm.fecthUsers()
      }
   }
}
#Preview {
   ProfileView()
}


