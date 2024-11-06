//
//  PokemonDetailViewModel.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    private var cancellables = Set<AnyCancellable>()
    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func fetchPokemonDetail() {
        NetworkManager.shared.fetchPokemonDetail(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error while fetching pokemon detail: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] detail in
                self?.pokemonDetail = detail
            })
            .store(in: &cancellables)
    }
}
