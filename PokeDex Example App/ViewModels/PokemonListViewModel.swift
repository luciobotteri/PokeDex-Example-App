//
//  PokemonListViewModel.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList = [PokemonListEntry]()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPokemonList() {
        NetworkManager.shared.fetchPokemonList(limit: 100)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error while fetching pokemon list: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] pokemons in
                let sortedList = pokemons.sorted { $0.name < $1.name }
                self?.pokemonList = sortedList
            })
            .store(in: &cancellables)
    }
}
