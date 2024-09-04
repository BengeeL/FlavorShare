//
//  NotificationManager.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-27.
//

import Foundation

class NotificationManager {
    
    // MARK: VARIABLES
    static let shared = NotificationManager()
    private let service = NotificationService()
    
    // MARK: INIT
    private init() {
        
    }
    
    // MARK: FUNCTIONS
    // Send Functions
    func uploadLikePostNotification(toUid uid: String, post: Post) async throws {
        try await service.sendNotification(toUid: uid, type: .likePost, post: post)
    }
    
    func uploadLikeRecipeNotification(toUid uid: String, post: Post) async throws {
        try await service.sendNotification(toUid: uid, type: .likeRecipe, post: post)
    }
    
    func uploadCommentNotification(toUid uid: String, post: Post) async throws {
        try await service.sendNotification(toUid: uid, type: .comment, post: post)
    }
    
    func uploadFollowNotification(toUid uid: String) async throws {
        try await service.sendNotification(toUid: uid, type: .follow)
    }
    
    // Delete Functions
    func deleteLikePostNotification(notificationOwnerUid uid: String, post: Post) async throws {
        try await service.deleteNotification(toUid: uid, type: .likePost, post: post)
    }
    
    func deleteLikeRecipeNotification(notificationOwnerUid uid: String, post: Post) async throws {
        try await service.deleteNotification(toUid: uid, type: .likeRecipe, post: post)
    }
    
    func deleteCommentNotification(notificationOwnerUid uid: String, post: Post) async throws {
        try await service.deleteNotification(toUid: uid, type: .comment, post: post)
    }
    
    func deleteFollowNotification(notificationOwnerUid uid: String) async throws {
        try await service.deleteNotification(toUid: uid, type: .follow)
    }
}
