//
//  PokemonListResponse.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import Foundation

struct PokemonListResponse: Decodable {
    let results: [PokemonListEntry]
}
