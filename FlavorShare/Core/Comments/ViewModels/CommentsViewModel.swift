//
//  CommentViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-19.
//

import Firebase

@MainActor
class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post
    private let service: CommentService
    
    init (post: Post) {
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task {
            try await getPostComments()
        }
    }
    
    func uploadComment(commentText: String) async throws {
        let commentTextCleaned = String.cleanString(commentText)
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(
            postOwnerUid: post.ownerUid,
            commentOwnerUid: uid,
            postId: post.id,
            timestamp: Timestamp(),
            commentText: commentTextCleaned
        )
        
        try await service.uploadComment(comment)
        try await getPostComments()
        // TODO: FIND BETTER WAY TO AVOID DATABASE QUERIES
        //        comment.user = UserService.shared.currentUser
        //        self.comments.insert(comment, at: 0)
        //        self.comments[0].user = user
        
        try await NotificationManager.shared.uploadCommentNotification(toUid: post.ownerUid, post: post)
    }
    
    func getPostComments() async throws {
        self.comments = try await service.getPostComments()
        try await getCommentUserData()
    }
    
    func getCommentUserData() async throws {
        for i in 0 ..< comments.count {
            let comment = comments[i]
            let user = try await UserService.getUser(withUid: comment.commentOwnerUid)
            
            comments[i].user = user
        }
    }
}
