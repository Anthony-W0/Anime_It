//
//  ContentView.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import Combine


class User: ObservableObject, Codable {
    @Published var username: String
    @Published var fullname: String
    @Published var bio: String
    @Published var profileImageData: Data?

    enum CodingKeys: CodingKey {
        case username, fullname
    }

    init(username: String = "", fullname: String = "", bio: String = "") {
        self.username = username
        self.fullname = fullname
        self.bio = ""
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        username = try container.decode(String.self, forKey: .username)
        fullname = try container.decode(String.self, forKey: .fullname)
        bio = ""
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(fullname, forKey: .fullname)
    }
}



