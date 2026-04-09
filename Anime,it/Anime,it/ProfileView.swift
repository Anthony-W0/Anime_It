import SwiftUI

struct ProfileView: View {
   @StateObject var vm = UserViewModel()
   var body: some View {
       ScrollView {
           VStack(spacing: 16) {
               ProfileHeader()
               ProfileStatsView()

               Text("User Posts Here")
           }
           .padding()
       }
   }
}

