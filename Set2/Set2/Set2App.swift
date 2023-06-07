//
//  Set2App.swift
//  Set2
//
//  Created by Kevin Savinovich on 4/22/23.
//

import SwiftUI

@main
struct Set2App: App {
    let game = SetGame()
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
