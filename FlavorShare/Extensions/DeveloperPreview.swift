//
//  DeveloperPreview.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-19.
//

import SwiftUI
import Firebase

class DeveloperPreview {
//    static let shared = DeveloperPreview()
    
    // MARK: - COMMENT
    static let comment = Comment(
        postOwnerUid: "123",
        commentOwnerUid: "123",
        postId: "123",
        timestamp: Timestamp(),
        commentText: "This is a comment"
    )
    
    
    // MARK: - NOTIFICATIONS
    static let notications: [FSNotification] = [
        .init(
            id: NSUUID().uuidString,
            timestamp: Timestamp(),
            notificationSenderUid: "1123",
            type: .likePost
        ),
        .init(
            id: NSUUID().uuidString,
            timestamp: Timestamp(),
            notificationSenderUid: "451",
            type: .comment
        ),
        .init(
            id: NSUUID().uuidString,
            timestamp: Timestamp(), notificationSenderUid: "1123",
            type: .comment
        ),
        .init(
            id: NSUUID().uuidString,
            timestamp: Timestamp(), notificationSenderUid: "4457",
            type: .follow
        ),
        .init(
            id: NSUUID().uuidString,
            timestamp: Timestamp(), notificationSenderUid: "1123",
            type: .likePost
        ),
        .init(
            id: NSUUID().uuidString,
            timestamp: Timestamp(), notificationSenderUid: "545",
            type: .likeRecipe
        )
    ]
    
    
    // MARK: - INGRDIENTS
    static let ingredients: [Ingredient] = [
        .init(
            id:NSUUID().uuidString,
            name: "Carrot",
            imageURL: "IngredientExample"
        ),
        .init(
            id:NSUUID().uuidString,
            name: "Apple",
            imageURL: "IngredientExample"
        )
    ]
    
    
    // MARK: - POSTS
    static let posts: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            title: "This is a title",
            caption: "This is a test caption",
            imageURL: "post-1",
            timestamp: Timestamp(),
            likes: 1084,
            user: users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            title: "This is a title",
            caption: "This is a test caption",
            imageURL: "post-2",
            timestamp: Timestamp(),
            likes: 410,
            user: users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            title: "This is a title",
            caption: "This is a test caption",
            imageURL: "post-3",
            timestamp: Timestamp(),
            likes: 125,
            user: users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            title: "This is a title",
            caption: "This is a test caption",
            imageURL: "post-4",
            timestamp: Timestamp(),
            likes: 84,
            user: users[0]
        )
    ]
    
    
    // MARK: - RECIPES
    static let recipes: [Recipe] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            imageURL: "post-1",
            timestamp: Date(),
            title: "Nacho Vegan",
            description: "This delicious nacho will steal the show on your next party",
            stars: 4,
            likes: 123,
            ingredients: ingredients,
            instructions: instructions,
            cookTime: 45,
            servings: 4,
            type: CuisineType.African,
            calories: 600
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            imageURL: "post-2",
            timestamp: Date(),
            title: "Artichoke Soup",
            description: "This delicious nacho will steal the show on your next party",
            stars: 5,
            likes: 42,
            ingredients: ingredients,
            instructions: instructions,
            cookTime: 52,
            servings: 4,
            type: CuisineType.Indian,
            calories: 985
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            imageURL: "post-3",
            timestamp: Date(),
            title: "Meatballs Macaronies",
            description: "This delicious nacho will steal the show on your next party",
            stars: 0,
            likes: 25,
            ingredients: ingredients,
            instructions: instructions,
            cookTime: 32,
            servings: 4,
            type: CuisineType.Caribbean,
            calories: 274),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            imageURL: "post-4",
            timestamp: Date(),
            title: "Shrimp Pasta",
            description: "This delicious nacho will steal the show on your next party",
            likes: 34,
            ingredients: ingredients,
            instructions: instructions,
            cookTime: 58,
            servings: 4,
            type: CuisineType.Italian,
            calories: 254
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            imageURL: "post-5",
            timestamp: Date(),
            title: "Hummus with Pita Bread",
            description: "This delicious nacho will steal the show on your next party",
            likes: 833,
            ingredients: ingredients,
            instructions: instructions,
            cookTime: 41,
            servings: 4,
            type: CuisineType.Chinese,
            calories: 3548
        )
    ]
    
    // MARK: - USERS
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            email: "benjamin.lefebvre.1024@gmail.com",
            username: "BengeeL",
            firstName: "Benjamin",
            lastName: "Lefebvre",
            phone: "8192085173",
            dateOfBirth: Date(),
            profileImageURL: nil,
            bio: "Software Engineering Student Living in the Kichen with my Computer"
        ),
        .init(
            id: NSUUID().uuidString,
            email: "ali.lefebvre.1024@gmail.com",
            username: "AliBo", 
            firstName: "Ali",
            lastName: "Rasikh", 
            phone: "4162085173",
            dateOfBirth: Date(),
            profileImageURL: nil
        ),
        .init(
            id: NSUUID().uuidString,
            email: "eve.lefebvre.1024@gmail.com", 
            username: "Evee",
            firstName: "Eve",
            lastName: "Lefebvre",
            phone: "8192085173",
            dateOfBirth: Date(),
            profileImageURL: nil
        ),
        .init(
            id: NSUUID().uuidString,
            email: "kathy.lefebvre.1024@gmail.com",
            username: "MOMMY", 
            firstName: "Kathy",
            lastName: "Guimond", 
            phone: "8192085173",
            dateOfBirth: Date()
        ),
        .init(
            id: NSUUID().uuidString,
            email: "chef.lefebvre.1024@gmail.com",
            username: "Chef",
            firstName: "Boutro",
            lastName: "Oil",
            phone: "1234569870",
            dateOfBirth: Date(),
            profileImageURL: nil
        )
    ]
    
    // MARK: - INSTRUCTIONS
    static let instructions: [Instruction] = [
        .init(
            id:NSUUID().uuidString, 
            stepNumber: 1, 
            stepDescription: "Open the can of beans"
        ),
        .init(
            id:NSUUID().uuidString, 
            stepNumber: 2, 
            stepDescription: "Preheat oven to 400 degrees."
        ),
        .init(
            id:NSUUID().uuidString, 
            stepNumber: 3, 
            stepDescription: "Cut all the veggies."
        ),
        .init(
            id:NSUUID().uuidString, 
            stepNumber: 4, 
            stepDescription: "Mix the Salade With all the veggies than split equally between the plates."
        )
    ]
    
    // MARK: - GROCERY ITEMS
    static let groceryList: [GroceryItem] = [
        .init(
            id:NSUUID().uuidString,
            category: "Produces",
            name: "Cucumber",
            quantity: 1,
            isChecked: true
        ),
        .init(
            id:NSUUID().uuidString,
            category: "Produces",
            name: "Carrot",
            quantity: 3,
            isChecked: false
        ),
        .init(
            id:NSUUID().uuidString,
            category: "Produces",
            name: "Patato",
            quantity: 1,
            isChecked: false
        ),
        .init(
            id:NSUUID().uuidString,
            category: "Groceries",
            name: "Rice",
            quantity: 1,
            isChecked: false
        ),
        .init(
            id:NSUUID().uuidString,
            category: "Groceries",
            name: "Wine",
            quantity: 4,
            isChecked: false
        ),
        .init(
            id:NSUUID().uuidString,
            category: "Groceries",
            name: "Chocolate",
            quantity: 1,
            isChecked: false
        )
    ]
}
