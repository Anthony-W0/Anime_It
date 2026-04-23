//
//  Login.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/15/26.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var auth: AuthManager
    
    @State private var username = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var isSignup = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(isSignup ? "Create Account" : "Log In")
                    .font(.largeTitle)
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                if isSignup {
                    TextField("Full Name", text: $fullname)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                }
                
                Button(isSignup ? "Sign up" : "Login") {
                    if isSignup {
                        auth.signUp(username: username, fullname: fullname) }
                    else {
                        auth.login(username: username)
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundStyle(Color.white)
                .cornerRadius(8)
                
                Button(isSignup ? "Already have an account? Login" : "don't have an account? Sign up") {
                    isSignup.toggle()
                }
            }
        }
    }
}
#Preview {
    LoginView(auth: .init())
}
