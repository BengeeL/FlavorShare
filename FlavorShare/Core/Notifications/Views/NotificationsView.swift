//
//  NotificationView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = NotificationViewModel(service: NotificationService())
    
    var body: some View {
        NavigationStack {
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
                ProfileView(user: user)
            })
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button ("Back") {
                        dismiss()
                    }
                }
            }
        }
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    NotificationsView()
}
