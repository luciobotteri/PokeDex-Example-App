//
//  NetworkManager.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import Combine
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://pokeapi.co/api/v2/"
    
    func fetchPokemonList(limit: Int) -> AnyPublisher<[PokemonListEntry], Error> {
        let urlString = "\(baseURL)pokemon?limit=\(limit)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokemonListResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonDetail(url: String) -> AnyPublisher<PokemonDetail, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokemonDetail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
