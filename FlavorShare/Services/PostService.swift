//
//  PostService.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import Firebase

struct PostService {
    static func getFeedPosts() async throws -> [Post] {
        var users = [String: User]()
        let snapshot = try await FirebaseContants
            .PostsCollection
            .getDocuments()
        
        var posts: [Post] = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            
            if users[ownerUid] == nil {
                let postUser = try await UserService.getUser(withUid: ownerUid)
                users[ownerUid] = postUser
            }
            
            posts[i].user = users[ownerUid]
        }
        
        return posts
    }
    
    static func getUserPosts(withUid uid: String) async throws -> [Post] {
        let snapshot = try await FirebaseContants
            .PostsCollection
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
    
    static func getPost(_ postId: String) async throws -> Post {
        return try await FirebaseContants
            .PostsCollection
            .document(postId)
            .getDocument(as: Post.self)
    }
}

// MARK: LIKES

extension PostService {
    
    static func likePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseContants
            .PostLikesCollection(postId: post.id)
            .document(uid)
            .setData([:])
        
        async let _ = try await FirebaseContants
            .PostsCollection
            .document(post.id)
            .updateData(["likes": post.likes + 1])
        
        async let _ = try await FirebaseContants
            .UserLikesCollection(uid: uid)
            .document(post.id)
            .setData([:])
    }
    
    static func unlikePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseContants
            .PostLikesCollection(postId: post.id)
            .document(uid)
            .delete()
        
        async let _ = try await FirebaseContants
            .PostsCollection
            .document(post.id)
            .updateData(["likes": post.likes - 1])
        
        async let _ = try await FirebaseContants
            .UserLikesCollection(uid: uid)
            .document(post.id)
            .delete()
    }
    
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirebaseContants
            .UserLikesCollection(uid: uid)
            .document(post.id)
            .getDocument()
        
        return snapshot.exists
    }
}
