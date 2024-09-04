//
//  ContentViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    // MARK: VARIABLES
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    // MARK: INIT
    init() {
        setupSuscribers()
    }
    
    // MARK: FUNCTIONS
    func setupSuscribers() {
        service.$userSession
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userSession in
                self?.userSession = userSession
            }
            .store(in: &cancellables)
        
        UserService.shared.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] currentUser in
                self?.currentUser = currentUser
            }
            .store(in: &cancellables)
    }
}
