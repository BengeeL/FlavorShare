//
//  User.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String? // Optional for users who don't want to share their phone number

    let username: String
    let dateOfBirth: Date
    
    let password: String
    let confirmPassword: String

    // **Never store password in plain text!**
    // Use secure hashing algorithms and keystores for password management.

    let profilePic: String? // URL or data representing profile picture
    let bio: String? // User bio
    let interests: [String]? // Array of user interests
    
    // Consider using separate structures or libraries for relationships like friends/followers
    // for better organization and scalability.

    init(firstName: String,
         lastName: String,
         email: String,
         phone: String? = nil,
         username: String,
         dateOfBirth: Date,
         password: String,
         confirmPassword: String,
         profilePic: String? = nil,
         bio: String? = nil,
         interests: [String]? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.username = username
        self.dateOfBirth = dateOfBirth
        self.password = password
        self.confirmPassword = confirmPassword
        self.profilePic = profilePic
        self.bio = bio
        self.interests = interests
    }
}
