//
//  PokemonDetailViewModelTests.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import XCTest
import Combine
@testable import PokeDex_Example_App

class PokemonDetailViewModelTests: XCTestCase {
    var viewModel: PokemonDetailViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = PokemonDetailViewModel(url: "https://pokeapi.co/api/v2/pokemon/1/")
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchPokemonDetail() {
        let expectation = XCTestExpectation(description: "Fetch Pokémon detail")
        
        viewModel.$pokemonDetail
            .dropFirst()
            .sink { detail in
                if detail != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchPokemonDetail()
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(viewModel.pokemonDetail)
        XCTAssertEqual(viewModel.pokemonDetail?.name, "bulbasaur")
    }
}
