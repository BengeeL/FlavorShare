//
//  CommentService.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-19.
//

import Firebase
import FirebaseFirestoreSwift

struct CommentService {
    // MARK: VARIABLES
    let postId: String
    
    // MARK: FUNCTIONS
    func uploadComment(_ comment: Comment) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await FirebaseContants
            .PostCommentsCollection(postId: postId)
            .addDocument(data: commentData)
    }
    
    func getPostComments() async throws -> [Comment] {
        let snapshot = try await FirebaseContants
            .PostCommentsCollection(postId: postId)
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Comment.self) })
    }
}
