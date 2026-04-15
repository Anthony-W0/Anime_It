//
//  Post.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/15/26.
//

import Foundation

struct Post: Identifiable, Codable {
    var id = UUID()
    let imageName: String
    var title: String
    
    var body: String
    var date: Date = .now
  }
