//
//  Collection+SafeAccess.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 28/11/2022.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
