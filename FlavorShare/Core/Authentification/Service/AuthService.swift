//
//  AuthService.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
        try await loadUserData()
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String,
                    firstName: String, lastName: String, phone: String, dateOfBirth: Date) async throws {
        // Register User
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        // Save User Session
        self.userSession = result.user
        
        // Save User Data
        await uploadUserData(uid: result.user.uid, email: email, username: username, firstName: firstName, lastName: lastName, phone: phone, dateOfBirth: dateOfBirth)
    }
    
    @MainActor
    func loadUserData() async throws {
        // Set User Session
        self.userSession = Auth.auth().currentUser
        
        try await UserService.shared.getCurrentUser()
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
    
    private func uploadUserData(uid: String, email: String, username: String,
                                firstName: String, lastName: String, phone: String, dateOfBirth: Date) async {
        // User object
        let user = User(id: uid, email: email, username: username, firstName: firstName, lastName: lastName, phone: phone, dateOfBirth: dateOfBirth)
        
        // Set Current User
        UserService.shared.currentUser = user
        
        // Encode user data for Firestore
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        // Send Data to Firestore in collection "user"
        try? await FirebaseContants.UsersCollection.document(user.id).setData(encodedUser)
    }
}
