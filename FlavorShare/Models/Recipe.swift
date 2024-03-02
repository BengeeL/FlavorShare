//
//  Recipe.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation

struct Recipe {
    let name: String
    let image: String // Path to image resource
    let description: String
    let stars: Int

    
    let ingredients: [Ingredient] // List of ingredients
    let instructions: [String] // List of instruction steps
    
    let cookTime: Int // Cooking time in minutes (optional)
    let servings: Int // Number of servings (optional)
    let calories: Int
    let nutitionalValue: Dictionary<String, Int> // <Nutrition name, Grams> Exemple {"Protein": 19}
    
    init(name: String, 
         image: String,
         description: String,
         stars: Int,
         ingredients: [Ingredient],
         instructions: [String],
         cookTime: Int? = nil,
         servings: Int? = nil,
         calories: Int,
         nutitionalValue: Dictionary<String, Int>
    ) {
        self.name = name
        self.image = image
        self.description = description
        self.stars = stars
        self.ingredients = ingredients
        self.instructions = instructions
        self.cookTime = cookTime ?? 0 // Set default value to 0 if cookTime is nil
        self.servings = servings ?? 1 // Set default value to 1 if servings is nil
        self.calories = calories
        self.nutitionalValue = nutitionalValue
    }
}
