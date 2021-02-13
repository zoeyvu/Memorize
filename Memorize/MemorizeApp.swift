//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-01-29.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
