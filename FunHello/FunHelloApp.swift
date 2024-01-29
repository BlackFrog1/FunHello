//
//  FunHelloApp.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import SwiftUI

@main
struct FunHelloApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
