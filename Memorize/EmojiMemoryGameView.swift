//
//  EmojiMemryGame.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-01-29.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        HStack {
            Text(viewModel.theme.name)
                .font(.largeTitle).bold()
                .layoutPriority(1)
                .frame(width: 270, alignment: .leading)
            Text("Score: \(viewModel.score)")
                .font(.headline)
                .frame(width: 70, alignment: .bottomTrailing)
        }
        
        Grid(viewModel.cards) { card in
            CardView(viewModel: viewModel, card: card).onTapGesture {
                    viewModel.choose(card: card)
            }
                .padding(5)
        }
            .padding()
            .foregroundColor(viewModel.theme.color)
        .aspectRatio(2/3, contentMode: .fit)
        
        if viewModel.isNewGame {
            ZStack(alignment: .leading) {
                Text("New Game").onTapGesture {
                    viewModel.newGame()
                }
                    .font(.largeTitle)
                    .padding()
                    .border( Color.black, width: 4)
                    .cornerRadius(10)
            }
        }
    }
}

struct CardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(viewModel.theme.color)
                } 
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
