//
//  Cardify.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-03-20.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(color)
            }
        }
    }
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool, color: Color) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, color: color))
    }
}
