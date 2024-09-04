//
//  SwiftUIView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-11.
//

import SwiftUI

struct ProfileView: View {
    // MARK: VARIABLES
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var presentation
    
    let presentationMode: Bool
    
    private var user: User {
        return viewModel.user
    }
    
    // MARK: INIT
    init(user: User, presentationMode: Bool) {
        self.viewModel = ProfileViewModel(user: user)
        self.presentationMode = presentationMode
    }
    
    // MARK: BODY
    var body: some View {
        ScrollView (.vertical) {
            VStack (alignment: .leading) {
                if (presentationMode) {
                    Button("< Back") {
                        presentation.wrappedValue.dismiss()
                    }
                    .padding(.leading, 15)
                }
                
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
    ProfileView(user: DeveloperPreview.users[0], presentationMode: true)
}
