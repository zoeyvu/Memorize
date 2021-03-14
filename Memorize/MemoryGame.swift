//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-02-06.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var score: Int = 0
    var matchCount: Int = 0
    var isNewGame: Bool {
        matchCount*2 >= cards.count
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // if this is a match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    matchCount += 1
                } else if cards[chosenIndex].isSeen && cards[potentialMatchIndex].isSeen {
                    // if this is a mismatch and BOTH of the card are already seen
                    score -= 2
                } else if cards[chosenIndex].isSeen || cards[potentialMatchIndex].isSeen {
                    // if this is a mismatch and ONE of the card is already seen
                    score -= 1
                }
                // if none of the card was seen, then no penalty applied
                // No code needed
                
                self.cards[chosenIndex].isFaceUp = true
                cards[potentialMatchIndex].isSeen = true
                cards[chosenIndex].isSeen = true
                
            } else {
                // when the 3rd card is chosen, flip the other two cards over, and flip this one up
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex

            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
