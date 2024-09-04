//
//  UploadPost.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    // MARK: VARIABLES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var title = ""
    @State private var caption = ""
    @State private var imagePickerPresented = false
    
    @StateObject var viewModel = UploadPostViewModel()
    
    // MARK: BODY
    var body: some View {
        ZStack{
            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    // MARK: ACTION TOOLBAR
                    HStack {
                        Button {
                            clearDataAndCloseNewPost()
                        } label: {
                            Text("Cancel")
                        }
                        
                        Spacer()
                        
                        Button {
                            Task {
                                try await viewModel.uploadPost(title: title, caption: caption)
                                clearDataAndCloseNewPost()
                            }
                        } label: {
                            Text("Upload")
                        }
                    }
                    .padding(.vertical)
                    
                    // MARK: PAGE TITLE
                    LargeTitle(title: "New Post")
                    
                    // MARK: UPLOAD IMAGE
                    UploadImage(image: $viewModel.postImage, imagePickerPresented: $imagePickerPresented)
//                    ZStack {
//                        Rectangle()
//                            .foregroundStyle(.tile)
//                        
//                        if let image = viewModel.postImage {
//                            image
//                                .resizable()
//                                .scaledToFill()
//                        }
//                        
//                        Button {
//                            imagePickerPresented.toggle()
//                        } label: {
//                            Text("\(viewModel.postImage == nil ? "Add Image" : "")")
//                                .foregroundStyle(.customBlue)
//                                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2.3)
//                                .cornerRadius(25)
//                        }
//                    }
//                    .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2.3)
//                    .cornerRadius(25)
//                    .shadow(radius: 3)
                    
                    // MARK: TITLE
                    UploadTextInput(placehorder: "Post Title", text: $title)
                    
                    // MARK: CAPTION
                    UploadTextInput(placehorder: "Post Caption", text: $caption)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarBackButtonHidden(true)
            .background(Color(.background))
            .onAppear{
                imagePickerPresented.toggle()
            }
            .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
            
            if (viewModel.isLoading) {
                LoadingScreen()
            }
        }
    }
    
    // MARK: FUNCTIONS
    func clearDataAndCloseNewPost() {
        title = ""
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        self.presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    UploadPostView()
}
