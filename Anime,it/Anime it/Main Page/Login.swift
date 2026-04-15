//
//  Login.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/15/26.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var user: User

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Anime_It")

                NavigationLink(destination: ProfileView(user: user)) {
                    Text("Login")
                }
            }
        }
    }
}
#Preview {
    LoginView(user: User(username: "Preview", fullname: "Preview User", bio: "This is a preview", posts: []))
}
