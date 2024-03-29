//
//  UserListViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users = [User] ()
    
    init() {
        
    }
    
    func getUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.getUsers(forConfig: config)
        } catch {
            print("UserListViewModel: getUsers(forConfig:) - Failed. \(error.localizedDescription)")
        }
    }
}
