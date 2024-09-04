//
//  Contants.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-20.
//

import Firebase

struct FirebaseContants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
    static let PostsCollection = Root.collection("posts")
    static let FollowingCollection = Root.collection("following")
    static let FollowersCollection = Root.collection("followers")
//    static let MessagesCollection = Root.collection("messages")
    
    static func UserNotificationCollection(uid: String) -> CollectionReference {
        return UsersCollection.document(uid).collection("user-notifications")
    }
    
    static func GroceryListCollection(uid: String) -> CollectionReference {
        return UsersCollection.document(uid).collection("grocery-list")
    }
    
    static func UserLikesCollection(uid: String) -> CollectionReference {
        UsersCollection.document(uid).collection("user-likes")
    }
    
    static func PostLikesCollection(postId: String) -> CollectionReference {
        PostsCollection.document(postId).collection("post-likes")
    }
    
    static func PostCommentsCollection(postId: String) -> CollectionReference {
        UsersCollection.document(postId).collection("post-comments")
    }
}
