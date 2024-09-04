//
//  HomeViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import Foundation
import Firebase

class HomeViewModel: ObservableObject {
    // MARK: VARIABLES
    @Published var posts = [Post]()
        
    // MARK: INIT
    init () {
        Task {
            try await getPosts()
        }
    }
    
    // MARK: FUNCTIONS
    @MainActor
    func getPosts() async throws {
        self.posts = try await PostService.getFeedPosts()
    }
}
