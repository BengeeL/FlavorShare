//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-11.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    private var user: User {
        return viewModel.user
    }
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
        
    var body: some View {
            ScrollView (.vertical) {
                VStack {
                    // User Profile
                    ProfileHeader(user: user)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    Divider()
                    
                    PostGridView(user: user)
                }
                .padding(.top, 10)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("BackgroundColor"))
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.users[0])
}
