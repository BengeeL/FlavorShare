//
//  Instruction.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-28.
//

import Foundation

struct Instruction: Identifiable, Hashable, Codable  {
    let id: String
    let stepNumber: Int
    let stepDescription: String
}
