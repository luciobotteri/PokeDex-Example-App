//
//  ImageLoader.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let urlString: String
    private var cancellable: AnyCancellable?
    private static let cache = NSCache<NSString, UIImage>()
    
    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }
    
    private func loadImage() {
        if let cachedImage = Self.cache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveOutput: { [weak self] in
                if let image = $0 {
                    Self.cache.setObject(image, forKey: self?.urlString as NSString? ?? "")
                }
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}
