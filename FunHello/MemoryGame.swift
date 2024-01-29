//
//  MemorizeGame.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        // create empty array - swift does type inference
        cards = []
        // add number Of Pairs Of Cards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
        }
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    
    mutating func choose(_ card: Card) {
        print("chose \(card)")
        // card.isFaceUp.toggle()
        
        
        
        
        // get our card from the array
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                
                
                if let potentialCardIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialCardIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialCardIndex].isMatched = true
                    }
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUp = true
            }
            
            
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}
