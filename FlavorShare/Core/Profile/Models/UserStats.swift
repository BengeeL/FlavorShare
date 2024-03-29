//
//  UserStats.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-29.
//

import Foundation

struct UserStats: Codable, Hashable {
    var followingCount: Int
    var followersCount: Int
    var postCounts: Int
}
