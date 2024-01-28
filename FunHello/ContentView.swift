//
//  ContentView.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💀", "👻", "👺", "🎃", "🕷️","🧙", "👻", "👺", "🎃", "🕷️"]
    
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            
            ForEach(emojis.indices, id: \.self) { index in
                CardView(icon: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}









#Preview {
    ContentView()
}
