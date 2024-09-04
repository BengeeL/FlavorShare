//
//  GroceryItem.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-08-16.
//

import Foundation

struct GroceryItem: Identifiable, Hashable, Codable {
    let id: String
    let category: String
    let name: String
    let quantity: Int
    var isChecked: Bool
}
