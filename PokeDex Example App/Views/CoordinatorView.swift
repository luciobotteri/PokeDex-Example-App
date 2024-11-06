//
//  CoordinatorView.swift
//  PokeDex Example App
//
//  Created by Lucio Botteri on 06/11/24.
//

import SwiftUI

struct CoordinatorView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        //I need to specify the name of the app to avoid name conflicts
        PokeDex_Example_App.Coordinator.shared.start()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
