//
//  CommentsCell.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import SwiftUI

struct CommentsCell: View {
    
    let comment: Comment
    private var user: User? {
        return comment.user
    }
    
    var body: some View {
        HStack (spacing: 10){
            ProfilePicture(user: user, size: .small)
            
            VStack (alignment: .leading){
                HStack {
                    if let username = user?.username {
                        Text(username)
                            .fontWeight(.heavy)
                    }
                    
                    Text("\(comment.timestamp.timestampString()) ago")
                        .foregroundStyle(.gray)
                }
                
                Text(comment.commentText)
            }
            .font(.body)
            
            Spacer()
        }
        .foregroundStyle(.text)
        .padding(.horizontal)
    }
}

#Preview {
    CommentsCell(comment: DeveloperPreview.comment)
}
