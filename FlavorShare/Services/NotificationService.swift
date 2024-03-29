//
//  NotificationService.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-27.
//

import Firebase

class NotificationService {
    
    func getNotifications() async throws -> [FSNotification] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await FirebaseContants
            .UserNotificationCollection(uid: currentUid)
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: FSNotification.self) })
    }
    
    func sendNotification(toUid uid: String, type: FSNotificationType, post: Post? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        
        let ref = FirebaseContants
            .UserNotificationCollection(uid: uid)
            .document()
        
        let notification = FSNotification(id: ref.documentID,
                                          postId: post?.id,
                                          timestamp: Timestamp(),
                                          notificationSenderUid: currentUid,
                                          type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        try await ref.setData(notificationData)
    }
    
    func deleteNotification(toUid uid: String, type: FSNotificationType, post: Post? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await FirebaseContants
            .UserNotificationCollection(uid: uid)
            .whereField("notificationSenderUid", isEqualTo: currentUid)
            .getDocuments()
        
        // Get all notifications the user sent
        let notifications = snapshot.documents.compactMap({ try? $0.data(as: FSNotification.self) })
        
        // Get all notifications by type
        let filteredByType = notifications.filter({ $0.type == type })
        
        if type == .follow {
            for notificationToDelete in filteredByType {
                try await FirebaseContants
                    .UserNotificationCollection(uid: uid)
                    .document(notificationToDelete.id)
                    .delete()
            }
        } else {
            // Get the notification for that post
            guard let notificationToDelete = filteredByType.first(where: { $0.postId == post?.id }) else { return }
            
            try await FirebaseContants
                .UserNotificationCollection(uid: uid)
                .document(notificationToDelete.id)
                .delete()
        }
        
    }
}
