//
//  AspectVGrid.swift
//  FunHello
//
//  Created by Collin Bennett on 1/28/24.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    @ViewBuilder var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWithThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                
                ForEach (items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
            
        }
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
        
