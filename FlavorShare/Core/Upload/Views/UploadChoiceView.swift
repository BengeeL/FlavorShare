//
//  UploadChoiceView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import SwiftUI

struct UploadChoiceView: View {
    
    private let buttonWidth = UIScreen.main.bounds.width / 2.5
    private let buttonHeight = UIScreen.main.bounds.height / 2.8
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center, spacing: 20) {
                HStack (alignment: .center, spacing: 20) {
                    NavigationLink(destination: UploadPostView()) {
                        LargeTitle(title: "Share Post")
                            .shadow(color: .tile, radius: 30)
                            .shadow(color: .tile, radius: 40)
                            .shadow(color: .tile, radius: 50)
                            .shadow(color: .tile, radius: 60)
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(
                                Image("post-2")
                                    .resizable()
                                    .scaledToFill()
                                    .overlay(.tile.opacity(0.3))
                            )
                            .cornerRadius(25)
                            .shadow(radius: 3)
                    }
                    
                    NavigationLink(destination: UploadPostView()) {
                        LargeTitle(title: "Share Recipe")
                            .shadow(color: .tile, radius: 30)
                            .shadow(color: .tile, radius: 40)
                            .shadow(color: .tile, radius: 50)
                            .shadow(color: .tile, radius: 60)
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(
                                Image("post-4")
                                    .resizable()
                                    .scaledToFill()
                                    .overlay(.tile.opacity(0.3))
                            )
                            .cornerRadius(25)
                            .shadow(radius: 3)
                    }
                }
                HStack (alignment: .center, spacing: 20){
                    NavigationLink(destination: UploadPostView()) {
                        LargeTitle(title: "Share Story")
                            .shadow(color: .tile, radius: 30)
                            .shadow(color: .tile, radius: 40)
                            .shadow(color: .tile, radius: 50)
                            .shadow(color: .tile, radius: 60)
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(
                                Image("post-3")
                                    .resizable()
                                    .scaledToFill()
                                    .overlay(.tile.opacity(0.3))
                            )
                            .cornerRadius(25)
                            .shadow(radius: 3)
                    }
                    
                    NavigationLink(destination: UploadPostView()) {
//                        LargeTitle(title: "Go Live")
//                        .frame(width: buttonWidth, height: buttonHeight)
//                        .background(.tile)
//                        .cornerRadius(25)
//                        .shadow(radius: 3)
                        Text("")
                            .frame(width: buttonWidth, height: buttonHeight)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.background))
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    LargeTitle(title: "Upload")
                        .padding(.top, 10)
                }
            }
        }
    }
}

#Preview {
    UploadChoiceView()
}
