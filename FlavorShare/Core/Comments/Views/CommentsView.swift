//
//  CommentsView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import SwiftUI

struct CommentsView: View {
    // MARK: VARIABLES
    @State private var commentText = ""
    @StateObject var viewModel: CommentsViewModel
    
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    // MARK: INIT
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    
    // MARK: BODY
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            // MARK: TITLE
            LargeTitle(title: "Comments")
                .padding(.top, 10)
                .padding(.leading)
            
            Divider()
                .padding(.bottom)
            
            // MARK: COMMENT LIST
            ScrollView {
                LazyVStack (spacing: 20) {
                    ForEach(viewModel.comments) { comment in
                        CommentsCell(comment: comment)
                    }
                }
                .padding(.top, 5)
            }
            .refreshable {
                Task {
                    try await viewModel.getPostComments()
                }
            }
            
            Divider()
            
            // MARK: NEW COMMENT FIELD 
            HStack (spacing: 10) {
                ProfilePicture(user: currentUser, size: .small)
                
                ZStack (alignment: .trailing) {
                    TextField("Add a comment...", text: $commentText, axis: .vertical)
                        .padding()
                        .padding(.trailing, 40)
                        .overlay{
                            Capsule()
                                .stroke(.gray, lineWidth: 1)
                        }
                        .multilineTextAlignment(.leading)
                    
                    Button {
                        Task {
                            try await viewModel.uploadComment(commentText: commentText)
                            
                            commentText = ""
                        }
                    } label: {
                        Text("Post")
                            .foregroundStyle(.customBlue)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    CommentsView(post: DeveloperPreview.posts[0])
}
