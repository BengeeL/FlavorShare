//
//  SearchViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-14.
//

import Foundation

class SearchViewModel: ObservableObject {
    // MARK: VARIABLES
    @Published var users = [User] ()
    
    // MARK: INIT
    init() {
        Task { try await getAllUsers() }
    }
    
    // MARK: FUNCTIONS
    @MainActor
    func getAllUsers() async throws {
        self.users = try await UserService.getAllUsers()
    }
}
