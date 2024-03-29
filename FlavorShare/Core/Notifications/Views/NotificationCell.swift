//
//  NotificationCell.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import SwiftUI
import Firebase
import Kingfisher

struct NotificationCell: View {
    var notification: FSNotification
    
//    private var isFollowed: Bool {
//        return user.isFollowed ?? false
//    }
//    
//    private var buttonTitle: String {
//        if user.isCurrentUser {
//            return "Edit Profile"
//        } else {
//            return isFollowed ? "Following" : "Follow"
//        }
//    }
//    
//    private var buttonColor: LinearGradient {
//        if user.isCurrentUser || !isFollowed {
//            return LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing)
//        } else {
//            return LinearGradient(gradient: .init(colors: [.tile, .tile]), startPoint: .leading, endPoint: .trailing)
//        }
//    }
//    
//    private var buttonTextColor: Color {
//        if user.isCurrentUser {
//            return .white
//        } else {
//            return isFollowed ? .text : .white
//        }
//    }
    
    var body: some View {
        HStack {
            NavigationLink(value: notification.user) {
                ProfilePicture(user: notification.user, size: .small)
            }
            
            // Notification Message
            HStack {
                Text("\(notification.user?.username ?? "") ")
                    .font(.subheadline)
                    .fontWeight(.bold) +
                
                Text("\(notification.type.notificationMessage) ")
                    .font(.subheadline) +
                
                Text(notification.timestamp.timestampString())
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 5)
            
            Spacer()
            
            if (notification.type == .follow) {
                Button(action: {
                    handleFollowTapped()
                }, label: {
//                    Text(isFollowed ? "Following" : "Follow")
                    Text("Follow")
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing))
                        .fontWeight(.bold)
                        .cornerRadius(50)
                        .shadow(radius: 3.0)
                })
            } else {
                NavigationLink(value: notification.post) {
                    KFImage(URL(string: notification.post?.imageURL ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 3)
                }
            }
        }
        .padding(.horizontal)
    }
    
    func handleFollowTapped() {
//        if isFollowed {
//            viewModel.unfollow()
//        } else {
//            viewModel.follow()
//        }
    }
}

#Preview {
    NotificationCell(notification: DeveloperPreview.notications[1])
}
