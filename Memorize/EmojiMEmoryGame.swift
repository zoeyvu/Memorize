//
//  EmojiMEmoryGame.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-02-06.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    var theme: Theme
    
    @Published private(set) var model: MemoryGame<String>
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var isNewGame: Bool {
        model.isNewGame
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        self.theme = Theme.themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    init() {
        let theme = Theme.themes.randomElement()!
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        let numerOfPairsOfCard = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: numerOfPairsOfCard) { pairIndex in
                return emojis[pairIndex]
        }
        
    }
        
}
