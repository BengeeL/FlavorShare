//
//  ProfileHeader.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import SwiftUI

struct ProfileHeader: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showEditProfile = false

    private var user: User {
        return viewModel.user
    }
    
    private var isFollowed: Bool {
        return user.isFollowed ?? false
    }
    
    private var buttonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return isFollowed ? "Following" : "Follow"
        }
    }
    
    private var buttonColor: LinearGradient {
        if user.isCurrentUser || !isFollowed {
            return LinearGradient(gradient: .init(colors: [.customBlue, .customGreen]), startPoint: .leading, endPoint: .trailing)
        } else {
            return LinearGradient(gradient: .init(colors: [.tile, .tile]), startPoint: .leading, endPoint: .trailing)
        }
    }
    
    private var buttonTextColor: Color {
        if user.isCurrentUser {
            return .white
        } else {
            return isFollowed ? .text : .white
        }
    }
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .bottom) {
                // Profile Image
                ProfilePicture(user: user, size: .large)
                
                Spacer()
                
                // User Stats
                VStack (alignment: .trailing){
                    UserStat(value: user.stats?.postCounts, title: "Posts")
                    
                    NavigationLink(value: UserListConfig.followers(uid: user.id)) {
                        VStack (alignment: .trailing){
                            UserStat(value: user.stats?.followersCount, title: "Followers")
                        }
                    }
                    
                    NavigationLink(value: UserListConfig.following(uid: user.id)) {
                        VStack (alignment: .trailing){
                            UserStat(value: user.stats?.followingCount, title: "Following")
                        }
                    }
                }
            }
    
            // Username - Bio
            VStack (alignment: .leading, spacing: 5) {
                Text(user.username)
                    .fontWeight(.bold)
                
                if let bio = user.bio {
                    Text(bio)
                }
            }
            .font(.subheadline)
            .padding(.vertical)
            
            // Edit Profile Button
            Button(action: {
                if (user.isCurrentUser) {
                    showEditProfile.toggle()
                } else {
                    handleFollowTapped()
                }
            }, label: {
                Text(buttonTitle)
                    .foregroundStyle(buttonTextColor)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(buttonColor)
                    .fontWeight(.bold)
                    .cornerRadius(50)
                    .shadow(radius: 3.0)
            })
        }
        .navigationDestination(for: UserListConfig.self, destination: { config in
            UserListView(config: config)
        })
        .onAppear {
            viewModel.getUserStats()
            viewModel.isUserFollowed()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
           EditProfileView(user: user)
        }
    }
    
    func handleFollowTapped() {
        if isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}

#Preview {
    ProfileHeader(user: DeveloperPreview.users[0])
}
