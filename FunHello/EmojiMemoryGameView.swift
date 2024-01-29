//
//  EmojiMemoryGameView.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            
            cards
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .padding()
        }
    }
    

    private var cards: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWithThatFits(
                count: viewModel.cards.count,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.orange)
    }
    
    func gridItemWithThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        // try every possible column
        print("grid calculation: \(size)")
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            print("column count \(columnCount)")
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                let a = (size.width / columnCount).rounded(.down)
                print("Size: \(a)")
                return a
            }
            
            columnCount += 1.0
            
        } while columnCount < count
        let size = min(size.width / count, size.height * aspectRatio).rounded(.down)
        print("Default size: \(size)")
        return size
    }
    
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
