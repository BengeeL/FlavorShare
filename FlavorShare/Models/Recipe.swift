//
//  Recipe.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation

struct Recipe: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    
    let imageURL: String
    let timestamp: Date
    
    var title: String
    var description: String
    
    var stars: Int?
    
    var likes: Int
    var user: User?
    var ingredients: [Ingredient]
    var instructions: [Instruction]
    
    var cookTime: Int
    var servings: Int
    var type: CuisineType
    var calories: Int?
    var nutitionalValue: NutritionalValues?
}

