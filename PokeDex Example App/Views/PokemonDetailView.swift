//
//  PokemonDetailView.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        VStack {
            if let detail = viewModel.pokemonDetail {
                AsyncImageView(urlString: detail.sprites.frontDefault)
                    .frame(width: 150, height: 150)
                Text(detail.name.capitalized)
                    .font(.largeTitle)
                Text("ID: \(detail.id)")
                    .padding(.bottom)
                Text("Size:")
                    .font(.headline)
                Text("Height: \(detail.height)")
                Text("Weight: \(detail.weight)")
                    .padding(.bottom)
                VStack {
                    Text("Abilities:")
                        .font(.headline)
                    ForEach(detail.abilities, id: \.slot) { abilityEntry in
                        Text(abilityEntry.ability.name.capitalized)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchPokemonDetail()
        }
        .navigationTitle(viewModel.pokemonDetail?.name.capitalized ?? "Pokemon Detail")
    }
}
