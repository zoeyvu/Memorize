//
//  Themes.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-03-13.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var cardsNumber: Int?
    var color: Color
    
    static let humanoilds = Theme(name: "Humanoilds", emojis: ["🧝🏻‍♀️", "🧚🏿", "🧜🏼‍♂️", "🧙‍♀️", "🧙🏿‍♂️", "🧞‍♂️"], color: Color.gray)
    static let Families = Theme(name: "Families", emojis: ["👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦", "👨‍👩‍👧‍👧", "👩‍👩‍👧‍👦", "👩‍👩‍👧‍👧", "👨‍👨‍👦‍👦", "👨‍👨‍👧‍👧"], color: .pink)
    static let moonSun = Theme(name: "Moon and Sun", emojis: ["🌛", "🌚", "🌕", "🌖", "🌗", "🌘", "🌑"], color: .black)
    static let foods = Theme(name: "Foods", emojis: ["🍣", "🥟", "🍡", "🍜", "🍙", "🍲", "🫔"], color: .orange)
    static let flags = Theme(name: "Flags", emojis: ["🇻🇳", "🇬🇧", "🇰🇷", "🇨🇭", "🇷🇪", "🇳🇵", "🎌", "🇬🇪"], color: .green)
    static let dominos = Theme(name: "Donimos", emojis: ["🀱", "🀺", "🁀", "🁑", "🁒", "🁚", "🁠", "🁡"], color: .red)
    static let zodiacSigns = Theme(name: "Zodiac", emojis: ["♈️", "♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"], color: .purple)
    static let faces = Theme(name: "Faces", emojis: ["😳", "🥺", "😉", "😞", "😤"], color: .yellow)
    
    static var themes = [humanoilds, Families, moonSun, foods, flags, dominos, zodiacSigns, faces]
}
 
