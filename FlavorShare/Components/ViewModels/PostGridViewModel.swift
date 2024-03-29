//
//  PostGridViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import Foundation

class PostGridViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    private let user: User
    
    init(user: User) {
        self.user = user
        
        Task {
            try await getUserPosts()
        }
    }
    
    @MainActor
    func getUserPosts() async throws {
        self.posts = try await PostService.getUserPosts(withUid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
