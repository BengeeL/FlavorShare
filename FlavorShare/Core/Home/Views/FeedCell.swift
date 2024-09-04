//
//  NewsfeedPost.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    // MARK: TODO
    // TODO: CODE FUNCTIONALITY BROWSE TO USER PROFILE
    // TODO: CODE FUNCTIONALITY TO FOLLOW/UNFOLLOW BUTTON
    // TODO: CODE FUNCTIONALITY TO ADD RECIPE TO CALENDAR
    // TODO: CODE FUNCTIONALITY TO SHOW NAME OF 1-2 FRIENDS WHO LIKED
    // TODO: CODE FUNCTIONALITY TO SHARE
    
    // MARK: VARIABLES
    @ObservedObject var viewModel: FeedCellViewModel
    @State private var showComments = false
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return post.didLike ?? false
    }
    
    // MARK: INIT
    init (post: Post) {
        self.viewModel = FeedCellViewModel(post: post)
    }
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                // MARK: POST IMAGE
                KFImage(URL(string: post.imageURL))
                    .resizable()
                    .scaledToFill()
                
                // MARK: POST HEADER
                ZStack (alignment: .top) {
                    // shadowOverlay
                    LinearGradient(
                        gradient: .init(
                            colors: [.black.opacity(1), .clear]
                        ),
                        startPoint: .top,
                        endPoint: .bottom)
                    .frame(height: UIScreen.main.bounds.width / 3)
                    
                    // userInfo
                    HStack (alignment: .top) {
                        // Profile Picture
                        if let user = post.user {
                            ProfilePicture(user: user, size: .small)
                            
                            VStack (alignment: .leading){
                                // Username
                                Text("\(user.username)")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .shadow(radius: 10.0)
                                
                                // Follow Button
                                Text("Follow")
                                    .font(.subheadline)
                                    .foregroundStyle(.customBlue)
                                    .fontWeight(.bold)
                                    .shadow(radius: 10.0)
                            }
                        }
                        Spacer()
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "calendar.badge.plus") // calendar.badge.checkmark
                                .resizable()
                                .scaledToFill()
                                .foregroundStyle(.white)
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 10)
                                .padding(.top, 10)
                        })
                    }
                    .padding(15)
                }
            }
            
            // MARK: POST INFO
            ZStack {
                Rectangle()
                    .foregroundStyle(Color("TileColor"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Post Description
                VStack (alignment: .leading, spacing: 0){
                    HStack(alignment: .center) {
                        // MARK: POST STARS
//                        private var recipeStars: some View {
                            HStack (alignment: .center) {
                                let stars = 4
                                if (stars > 0) {
                                    ForEach(1...stars, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .imageScale(.large)
                                            .foregroundStyle(.customYellow)
                                    }
                                }
                                if (stars < 5) {
                                    ForEach(1...5 - stars, id: \.self) { _ in
                                        Image(systemName: "star")
                                            .imageScale(.large)
                                            .foregroundStyle(.customYellow)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.vertical, 15)
//                        }
                        
                        Spacer()
                        
                        // MARK: ACTION ICONS
                        HStack (alignment: .center, spacing: 10) {
                            // MARK: SHARE
                            Button {
                
                            } label: {
                                Image(systemName: "paperplane")
                                    .imageScale(.large)
                                    .foregroundStyle(Color("TextColor"))
                            }
                            
                            // MARK: COMMENT
                            Button {
                                showComments.toggle()
                            } label: {
                                Image(systemName: "message")
                                    .imageScale(.large)
                                    .foregroundStyle(Color("TextColor"))
                            }
                            
                            // MARK: LIKE
                            Button {
                                handleLikeTapped()
                            } label: {
                                Image(systemName: didLike ? "heart.fill" : "heart")
                                    .imageScale(.large)
                                    .foregroundStyle(didLike ? .customRed : .text)
                            }
                        }
                        .padding(.vertical, 15)
                    }
                    
                    // MARK: TITLE
                    Text("\(post.title)")
                        .foregroundStyle(Color("TitleColor"))
                        .font(.body)
                        .fontWeight(.heavy)
                    
                    // MARK: LIKES
                    if post.likes > 0 {
                        Text("\(post.likes) \(post.likes == 1 ? "like" : "likes")")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("TitleColor"))
                            .padding(.top, 5)
                            .padding(.bottom, 15)
                    }
                    
                    // MARK: CAPTION
                    Text("\(post.caption)")
                        .foregroundStyle(Color("TitleColor"))
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    // MARK: TIMESTAMP
                    HStack(alignment: .center) {
                        Text("\(post.timestamp.timestampString()) ago")
                            .font(.footnote)
                            .foregroundStyle(Color("TitleColor"))
                        
                        Spacer()
                        
                        if post.recipe != nil {
                            Text("See more")
                                .foregroundStyle(.customBlue)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                        }
                    }
                    .padding(.vertical, 15)
                }
                .padding(.horizontal, 15)
            }
            
        }
        .sheet(isPresented: $showComments, content: {
            CommentsView(post: post)
                .presentationDragIndicator(.visible)
        })
        .cornerRadius(25)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
    }
    
    // MARK: FUNCTIONS
    private func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlike()
            } else {
                try await viewModel.like()
            }
        }
    }
}

#Preview {
    FeedCell(post: DeveloperPreview.posts[0])
}
