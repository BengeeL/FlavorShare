//
//  NotificationView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import SwiftUI

struct NotificationsView: View {
    // MARK: VARIABLES
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = NotificationViewModel(service: NotificationService())
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            // MARK: NOTIFICATION LIST
            ScrollView {
                LazyVStack (spacing: 15) {
                    ForEach (viewModel.notifications) { notification in
                        NotificationCell(notification: notification)
                    }
                }
                .padding(.top)
            }
            .refreshable {
                Task{
                    await viewModel.getNotifications()
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user, presentationMode: false)
            })
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.large)
            .background(Color("BackgroundColor"))
        }
        
    }
}

#Preview {
    NotificationsView()
}
