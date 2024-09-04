//
//  ContentView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import SwiftUI

struct ContentView: View {
    // MARK: VARIABLES
    @StateObject var viewModel = ContentViewModel()
    
    // MARK: BODY
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                WelcomeView()
            } else if let currentUser = viewModel.currentUser {
                NavbarView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
