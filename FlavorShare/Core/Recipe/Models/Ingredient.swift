//
//  Ingredient.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import Foundation

struct Ingredient: Identifiable, Hashable, Codable  {
    let id: String
    let name: String
    let imageURL: String
}
