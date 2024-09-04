//
//  CurrentUserProfileView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-12.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    // MARK: TODO
    // TODO: IMPLEMENT MESSAGE FUNCTIONALITY
    // TODO: IMPLEMENT APP SETTING (3 LINES BUTTONS)
    // TODO: MODIFY THE CONTENT VIEW TO MAKE IT UNIQUE?
    
    // MARK: VARIABLES
    @State var showNotification = false;
    let user: User
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView (.vertical) {
                VStack {
                    // MARK: PROFILE SECTION
                    VStack (alignment: .leading, spacing: 10) {
                        ProfileHeader(user: user)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    Divider()
                    
                    // MARK: POST SECTION
                    PostGridView(user: user)
                }
                .padding(.top, 10)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    LargeTitle(title: "Profile")
                        .padding(.top, 10)
                }
                
                // MARK: TOOLBAR ACTION BUTTONS
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        // MARK: NOTIFICATIONS
                        Button {
                            showNotification.toggle()
                        } label: {
                            Image(systemName: "exclamationmark.bubble")
                                .foregroundStyle(.text)
                        }
                        
                        // MARK: MESSAGES
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                                .foregroundStyle(.text)
                        }
                        
                        // MARK: SETTINGS/CURRENTLY LOG OUT
                        Button {
                            AuthService.shared.signout()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.text)
                        }
                    }
                }
            }
            .sheet(isPresented: $showNotification, content: {
                NotificationsView()
                    .presentationDragIndicator(.visible)
            })
            //            .fullScreenCover(isPresented: $showNotification) {
            //                NotificationsView()
            //            }
            //            .navigationDestination(isPresented: $showNotification, destination: {
            //                NotificationsView()
            //            })
            .background(Color("BackgroundColor"))
        }
    }
}

#Preview {
    CurrentUserProfileView(user: DeveloperPreview.users[0])
}
