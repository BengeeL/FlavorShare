//
//  HomeViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import Foundation
import Firebase

class HomeViewModel: ObservableObject {
    @Published var posts = [Post]()
        
    init () {
        Task {
            try await getPosts()
        }
    }
    
    @MainActor
    func getPosts() async throws {
        self.posts = try await PostService.getFeedPosts()
    }
}
