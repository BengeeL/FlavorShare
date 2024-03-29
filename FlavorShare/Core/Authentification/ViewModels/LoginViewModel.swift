//
//  LoginController.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-06.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var loginError = ""
    
    @Published var isLoading = false
    
    func signIn() async throws {
        loginError = ""
        isLoading = true
        
        do {
            try await AuthService.shared.login(withEmail: email, password: password)
        } catch {
            loginError = "\(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
