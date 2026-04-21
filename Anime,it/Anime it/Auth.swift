//
//  Auth.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import Foundation
import SwiftUI
import Combine

class AuthManager: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    @Published var currentUser: User? = nil
    @Published var isLoggedIn: Bool = false

    private let userKey = "stored_user"

    init() {
        // Default values already set by property initializers.
        if let data = UserDefaults.standard.data(forKey: userKey),
           let user = try? JSONDecoder().decode(User.self, from: data) {
            self.currentUser = user
            self.isLoggedIn = true
        }
    }

    func signUp(username: String, fullname: String) {
        let user = User(username: username, fullname: fullname)
        saveUser(user)
        currentUser = user
        isLoggedIn = true
    }

    func login(username: String) {
        if let savedUser = loadUserFromStorage(),
           savedUser.username == username {
            currentUser = savedUser
            isLoggedIn = true
        }
    }
    func updateUser(_ user: User) {
        currentUser = user
        saveUser(user)
    }

    func logout() {
        currentUser = nil
        isLoggedIn = false
    }

    private func saveUser(_ user: User) {
        let data = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey: userKey)
    }

    private func loadUser() {
        if let user = loadUserFromStorage() {
            currentUser = user
            isLoggedIn = true
        }
    }

    private func loadUserFromStorage() -> User? {
        guard let data = UserDefaults.standard.data(forKey: userKey),
              let user = try? JSONDecoder().decode(User.self, from: data) else {
            return nil
        }
        return user
    }
}
