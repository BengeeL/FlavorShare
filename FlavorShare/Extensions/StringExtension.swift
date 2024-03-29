//
//  StringExtension.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-19.
//

import Foundation

extension String {
    static func cleanString(_ commentText: String) -> String {
        var result = commentText.trimmingCharacters(in: .whitespacesAndNewlines) // Remove spaces at the beginning and end
        result = result.replacingOccurrences(of: "\\n{3,}", with: "\n\n", options: .regularExpression) // Limit line jumps to 2 consecutive
        result = result.replacingOccurrences(of: " {6,}", with: "     ", options: .regularExpression) // Limit spaces to 5 consecutive
        return result
    }
}
