//
//  EmojiMemoryGame.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import SwiftUI

// View Model
class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["☠️", "👻", "😈", "🎃", "🕷️","🧙", "🙀", "🍭", "🕸️", "😱", "💀", "👺"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    // intent function
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

