import SwiftUI

struct ProfileView: View {
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

