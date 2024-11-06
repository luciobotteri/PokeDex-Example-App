//
//  PokeDex_Example_AppTests.swift
//  PokeDex Example AppTests
//
//  Created by Lucio Botteri on 06/11/24.
//

import XCTest
import Combine
@testable import PokeDex_Example_App

class PokemonListViewModelTests: XCTestCase {
    var viewModel: PokemonListViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = PokemonListViewModel()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchPokemonList() {
        let expectation = XCTestExpectation(description: "Fetch Pokémon list")
        
        viewModel.$pokemonList
            .dropFirst()
            .sink { pokemons in
                if pokemons.count == 100 {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchPokemonList()
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(viewModel.pokemonList.count, 100)
    }
}
