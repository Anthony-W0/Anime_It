//
//  Detail.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/15/26.
//

import SwiftUI
import Foundation

struct DetailView: View {
    
    let url: String?
    
    var webView: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
