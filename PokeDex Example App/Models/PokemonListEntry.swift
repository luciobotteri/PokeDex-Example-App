//
//  PokemonListEntry.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import Foundation

struct PokemonListEntry: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
