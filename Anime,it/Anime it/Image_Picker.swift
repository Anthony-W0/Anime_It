//
//  Image_Picker.swift
//  Anime it
//
//  Created by Anthony Whitmore on 4/18/26.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @Binding var imageData: Data?

    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) {
            Text("Select Profile Photo")
        }
        .onChange(of: selectedItem) { oldValue, newValue in
            Task {
                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                    imageData = data
                }
            }
        }
    }
}
