//
//  Comment.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-19.
//

import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    
    let postOwnerUid: String
    let commentOwnerUid: String
    let postId: String
    let timestamp: Timestamp
    var commentText: String
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
}
