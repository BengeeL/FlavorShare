//
//  FeedPostViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init (post: Post) {
        self.post = post
        Task {
            try await checkIfUserLikedPost()
        }
    }
    
    func like() async throws {
        do {
            let tempPost = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(tempPost)
            try await NotificationManager.shared.uploadLikePostNotification(toUid: post.ownerUid, post: post)
        } catch {
            post.didLike = false
            post.likes -= 1
        }
    }
    
    func unlike() async throws {
        do {
            let tempPost = post
            post.didLike = false
            post.likes -= 1
            try await PostService.unlikePost(tempPost)
            try await NotificationManager.shared.deleteLikePostNotification(notificationOwnerUid: post.ownerUid, post: post)
        } catch {
            post.didLike = true
            post.likes += 1
        }
    }
    
    func checkIfUserLikedPost() async throws{
        self.post.didLike = try await PostService.checkIfUserLikedPost(post)
    }
}
