//
//  Coordinator.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import UIKit
import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate {
    static let shared = Coordinator()
    private var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let rootView = PokemonListView()
        let hostingController = UIHostingController(rootView: rootView)
        let navController = UINavigationController(rootViewController: hostingController)
        navController.delegate = self
        self.navigationController = navController
        return navController
    }
    
    func showDetail(for pokemon: PokemonListEntry) {
        let viewModel = PokemonDetailViewModel(url: pokemon.url)
        let detailView = PokemonDetailView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
