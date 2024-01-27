//
//  ContentView.swift
//  FunHello
//
//  Created by Collin Bennett on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💀", "👻", "👺", "🎃", "🕷️"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(icon: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let icon: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(icon).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}







#Preview {
    ContentView()
}
