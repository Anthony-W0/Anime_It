//
//  MockData.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

class MockData {
    static let auth: AuthManager = {
        let auth = AuthManager()
        auth.currentUser = User(username: "demo", fullname: "Demo User")
        auth.isLoggedIn = true
        return auth
    }()
}

