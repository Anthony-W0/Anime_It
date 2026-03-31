//
//  ArtworkCard.swift
//  Anime,it
//
//  Created by Anthony Whitmore on 3/31/26.
//
import SwiftUI
import Foundation
import Combine

struct ArtworkCardView: View {
    var artwork: Artwork
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(artwork.title)
                .font(.headline)
                .lineLimit(1)
            Image(artwork.imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipped()
                .cornerRadius(10)
            Text(artwork.description)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .frame(width: 140)
    }
    
}

