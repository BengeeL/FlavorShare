//
//  SearchViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-14.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User] ()
    
    init() {
        Task { try await getAllUsers() }
    }
    
    @MainActor
    func getAllUsers() async throws {
        self.users = try await UserService.getAllUsers()
    }
}
