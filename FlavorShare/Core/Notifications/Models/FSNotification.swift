//
//  FSNotification.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import Firebase

struct FSNotification: Identifiable, Codable {
    let id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: FSNotificationType
    
    var post: Post?
    var user: User? 
}
