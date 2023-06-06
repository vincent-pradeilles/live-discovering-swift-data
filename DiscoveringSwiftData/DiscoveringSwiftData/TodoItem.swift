//
//  Item.swift
//  DiscoveringSwiftData
//
//  Created by Vincent on 06/06/2023.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var label: String
    var isDone: Bool
    
    init(label: String = "", isDone: Bool = false) {
        self.label = label
        self.isDone = isDone
    }
}

extension Bool: Comparable {
    public static func < (lhs: Bool, rhs: Bool) -> Bool {
        (lhs == false) && (rhs == true)
    }
}

extension TodoItem {
    static let placeholder: TodoItem = TodoItem(
        label: "Buy pizza 🍕"
    )
}
