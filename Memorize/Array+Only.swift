//
//  Array+Only.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-02-18.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
