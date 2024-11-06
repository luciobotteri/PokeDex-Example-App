//
//  PokeDex_Example_AppApp.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import SwiftUI

@main
struct PokeDex_Example_AppApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .ignoresSafeArea(edges: .bottom)
        }
    }
}
