//
//  PostGridView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    // MARK: VARIABLES
    @StateObject var viewModel: PostGridViewModel
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    // MARK: INIT
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    // MARK: BODY 
    var body: some View {
        VStack(alignment: .leading) {
            Text("Content")
                .font(.title)
                .foregroundStyle(Color("TitleColor"))
                .padding(.horizontal)

            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(viewModel.posts) { post in
                    KFImage(URL(string: post.imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageDimension, height: imageDimension)
                        .clipped()
                }
            }
        }
    }
}

#Preview {
    PostGridView(user: DeveloperPreview.users[0])
}
