//
//  ProfileStatsView.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/26/26.
//

import Foundation
import SwiftUI

struct ProfileStatsView: View {
    let postCount: Int

    var body: some View {
        HStack {
            VStack {
                Text("\(postCount)")
                Text("Posts")
            }
        }
    }
}


