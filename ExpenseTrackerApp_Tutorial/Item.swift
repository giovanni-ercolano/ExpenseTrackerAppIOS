//
//  Item.swift
//  ExpenseTrackerApp_Tutorial
//
//  Created by Giovanni Ercolano on 11/02/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
