//
//  Post.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/15/26.
//

import Foundation
import SwiftUI

struct Post: Identifiable, Codable {
    var id = UUID()
    let username: String
    let caption: String
}
