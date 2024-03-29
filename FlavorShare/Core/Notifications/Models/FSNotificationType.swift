//
//  FSNotificationType.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import Foundation

enum FSNotificationType: Int, Codable {
    case likePost
    case likeRecipe
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .likePost:
            return "liked your post."
        case .likeRecipe:
            return "liked your recipe."
        case .comment:
            return "commented on one of your recipe."
        case .follow:
            return "started following you."
        }
    }
}
