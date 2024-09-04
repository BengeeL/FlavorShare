//
//  ProfileViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-20.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func getUserStats() {
        guard user.stats == nil else { return }
        Task {
            self.user.stats = try await UserService.getUserStats(uid: user.id)
        }
    }
}


// MARK: Following

extension ProfileViewModel {
    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
            try await NotificationManager.shared.uploadFollowNotification(toUid: user.id)
        }
    }
    
    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
            try await NotificationManager.shared.deleteFollowNotification(notificationOwnerUid: user.id)
        }
    }
    
    func isUserFollowed() {
        guard user.isFollowed == nil else { return }
        Task {
            self.user.isFollowed = try await UserService.isUserFollowed(uid: user.id)
        }
    }
}
