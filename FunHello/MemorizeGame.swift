//
//  MemorizeGame.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    var cards: Array<Card>

    func choose(card: Card) {
        
    }
    
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
