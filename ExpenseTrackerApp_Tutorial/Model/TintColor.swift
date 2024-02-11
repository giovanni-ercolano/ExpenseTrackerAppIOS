//
//  TintColor.swift
//  ExpenseTrackerApp_Tutorial
//
//  Created by Giovanni Ercolano on 11/02/24.
//

import SwiftUI

/// Custom Tint Colors For Transaction Row

struct TintColor: Identifiable{
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange),
]
