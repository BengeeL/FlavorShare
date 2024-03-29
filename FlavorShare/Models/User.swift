//
//  User.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    let username: String
    
    var firstName: String
    var lastName: String
    
    var phone: String
    var dateOfBirth: Date
    var profileImageURL: String?
    var bio: String?
    
    var isFollowed: Bool? = false
    var stats: UserStats?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}
