//
//  PokemonDetail.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import Foundation

struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    let abilities: [PokemonAbilityEntry]
}

struct Sprites: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonAbilityEntry: Decodable {
    let slot: Int
    let ability: PokemonAbility
}

struct PokemonAbility: Decodable {
    let name: String
}
