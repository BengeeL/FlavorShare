//
//  Ingredient.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation

struct Ingredient {
    
    let name: String
    let image: String
    let grams: Int
    
    init (name: String, 
          image: String,
          grams: Int
    ) {
        self.name = name
        self.image = image
        self.grams = grams
    }
}
