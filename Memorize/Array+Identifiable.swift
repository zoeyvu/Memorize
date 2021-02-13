//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Zoey Vu on 2021-02-12.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 33
    }
}
