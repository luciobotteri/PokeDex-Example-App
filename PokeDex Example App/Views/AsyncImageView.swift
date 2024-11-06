//
//  AsyncImageView.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Image
    
    init(urlString: String, placeholder: Image = Image(systemName: "photo")) {
        _loader = StateObject(wrappedValue: ImageLoader(urlString: urlString))
        self.placeholder = placeholder
    }
    
    var body: some View {
        if let uiImage = loader.image {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
