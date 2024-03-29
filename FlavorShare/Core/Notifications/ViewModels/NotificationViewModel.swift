//
//  NotificationViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import Foundation

@MainActor
class NotificationViewModel: ObservableObject {
    @Published var notifications = [FSNotification]()
    
    private let service: NotificationService
    private var currentUser: User?
    
    init(service: NotificationService) {
        self.service = service
        Task {
            await getNotifications()
        }
        
        self.currentUser = UserService.shared.currentUser
    }
    
    func getNotifications() async {
        do {
            self.notifications = try await service.getNotifications()
            try await updateNotification()
        } catch {
            print("NotificationViewModel: getNotifcation() failed with error: \(error.localizedDescription)")
        }
    }
    
//    private func updateNotification() async throws {
//        let semaphore = DispatchSemaphore(value: 1)
//        await withThrowingTaskGroup(of: Void.self) { group in
//            for i in 0 ..< self.notifications.count {
//                group.addTask {
//                    semaphore.wait()
//                    let notification = await self.notifications[i]
//                    semaphore.signal()
//
//                    let user = try await UserService.getUser(withUid: notification.notificationSenderUid)
//                    var post: Post? = nil
//                    if let postId = notification.postId {
//                        post = try await PostService.getPost(postId)
//                    }
//
//                    semaphore.wait()
//                    self.notifications[i].user = user
//                    self.notifications[i].post = post
//                    semaphore.signal()
//                }
//            }
//        }
//    }

    private func updateNotification() async throws {
        for i in 0 ..< notifications.count {
            var notification = notifications[i]

            notification.user = try await UserService.getUser(withUid: notification.notificationSenderUid)
            
            if let postId = notification.postId {
                notification.post = try await PostService.getPost(postId)
                notification.post?.user = currentUser
            }
            
            notifications[i] = notification
        }
    }
}
