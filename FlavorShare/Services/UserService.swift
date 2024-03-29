//
//  UserService.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-14.
//

import Foundation
import Firebase

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func getCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await FirebaseContants
            .UsersCollection
            .document(uid)
            .getDocument(as : User.self)
    }
    
    static func getAllUsers() async throws -> [User] {
        let snapshot = try await FirebaseContants
            .UsersCollection
            .getDocuments()
        return snapshot.documents.compactMap( {try? $0.data(as: User.self) })
    }
    
    static func getUser(withUid uid: String) async throws -> User {
        // Get user data
        let snapshot = try await FirebaseContants
            .UsersCollection.document(uid)
            .getDocument()
        
        // Convert Firestore User Data to User model (Decode)
        return try snapshot.data(as: User.self)
    }
    
    static func getUsers(forConfig config: UserListConfig) async throws -> [User] {
        switch config {
        case .followers(uid: let uid):
            return try await getFollower(uid: uid)
        case .following(uid: let uid):
            return try await getFollowing(uid: uid)
        case .likes(postId: let postId):
            return try await getPostLikesUsers(postId: postId)
        case .explore:
            return try await getAllUsers()
        }
    }
    
    private static func getFollower(uid: String) async throws -> [User] {
        let snapshot = try await FirebaseContants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()
        
        return try await getUsers(snapshot)
    }
    
    private static func getFollowing(uid: String) async throws -> [User] {
        let snapshot = try await FirebaseContants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()
        
        return try await getUsers(snapshot)
    }
    
    private static func getPostLikesUsers(postId: String) async throws -> [User] {
        return []
    }
    
    private static func getUsers(_ snapshot: QuerySnapshot) async throws -> [User] {
        var users = [User]()
        
        for doc in snapshot.documents {
            users.append(try await getUser(withUid: doc.documentID))
        }
        
        return users
    }
}

// MARK: FOLLOWING

extension UserService {
    static func follow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseContants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:])
        
        async let _ = try await FirebaseContants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .setData([:])
    }
    
    static func unfollow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseContants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .delete()
        
        async let _ = try await FirebaseContants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .delete()
    }
    
    static func isUserFollowed(uid: String) async throws -> Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirebaseContants
            .FollowingCollection
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument()
        
        return snapshot.exists
    }
}

// MARK: USER STATS

extension UserService {
    static func getUserStats(uid: String) async throws -> UserStats {
        async let followingCount = FirebaseContants
            .FollowingCollection
            .document(uid)
            .collection("user-following")
            .getDocuments()
            .count
        
        async let followersCount = FirebaseContants
            .FollowersCollection
            .document(uid)
            .collection("user-followers")
            .getDocuments()
            .count
        
        async let postsCount = FirebaseContants
            .PostsCollection
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
            .count
        
        print("Getting User information")
        
        return try await UserStats(followingCount: followingCount, followersCount: followersCount, postCounts: postsCount)
    }
}

