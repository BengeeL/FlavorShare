//
//  Post.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-12.
//

import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let title: String
    let caption: String
    let imageURL: String
    let timestamp: Timestamp
    
    var likes: Int
    var user: User?
    var recipe: Recipe?
    
    var didLike: Bool? = false
}
