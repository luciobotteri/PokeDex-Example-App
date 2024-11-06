//
//  PokemonListView.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.pokemonList) { pokemon in
                Button {
                    Coordinator.shared.showDetail(for: pokemon)
                } label: {
                    HStack {
                        AsyncImageView(urlString: pokemonImageUrl(for: pokemon))
                            .frame(width: 60, height: 60)
                        Text(pokemon.name.capitalized)
                    }
                }
            }.ignoresSafeArea()
        }
        .navigationTitle("PokeDex")
        .onAppear {
            viewModel.fetchPokemonList()
        }
    }
    
    private func pokemonImageUrl(for pokemon: PokemonListEntry) -> String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(extractID(from: pokemon.url)).png"
    }
    
    private func extractID(from url: String) -> String {
        let components = url.split(separator: "/")
        let lastComponent = components.last { !$0.isEmpty } ?? ""
        return String(lastComponent)
    }
}
