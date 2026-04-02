import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var isLoading: Bool = false
    @State private var loginError: String?

    // Simple demo user to show after login
    private var demoUser: User {
        User(
            id: "1",
            username: "zephina",
            displayname: "Zephina",
            bio: "Doing art for fun :3",
            links: "https://google.com",
            profileImageName: "Profile",
            artworkImageName: "Artwork_zephina",
            isFollowing: 23,
            isFollower: 54,
            artworkCount: 4
        )
    }

    var body: some View {
        Group {
            if isLoggedIn {
                NavigationStack {
                    ProfileView(user: demoUser, featuredImageNames: ["Zephina pics", "Zephina pic 2", "Zephina pic 3"]) // adjust assets as needed
                        .navigationTitle("Profile")
                }
            } else {
                loginView
            }
        }
        .animation(.default, value: isLoggedIn)
    }

    private var loginView: some View {
        NavigationStack {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 64))
                        .foregroundStyle(.tint)
                    Text("Welcome Back")
                        .font(.title2).bold()
                    Text("Sign in to continue")
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textContentType(.username)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding(12)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .padding(12)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)

                    if let loginError {
                        Text(loginError)
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Button(action: handleLogin) {
                        HStack {
                            if isLoading { ProgressView().tint(.white) }
                            Text(isLoading ? "Signing In…" : "Sign In")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                    .disabled(isLoading || email.isEmpty || password.isEmpty)

                    Button("Forgot password?") {
                        // Hook up reset flow later
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                }

                Spacer()

                HStack(spacing: 8) {
                    Text("New here?")
                        .foregroundStyle(.secondary)
                    Button("Create an account") {
                        // Hook up sign-up later
                    }
                }
                .font(.footnote)
            }
            .padding()
            .navigationTitle("Login")
        }
    }

    private func handleLogin() {
        loginError = nil
        isLoading = true
        // Simulate async auth; replace with real auth later
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
            if email.lowercased().contains("@") && password.count >= 4 {
                isLoggedIn = true
            } else {
                loginError = "Invalid email or password."
            }
        }
    }
}

#Preview {
    ContentView()
}

