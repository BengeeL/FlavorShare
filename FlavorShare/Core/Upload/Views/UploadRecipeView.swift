//
//  UploadRecipeView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-29.
//

import SwiftUI

struct UploadRecipeView: View {
    
    // MARK: TODO
    // TODO: USE LIST LIKE REMINDER APP FOR INGREDIENTS & INSTRUCTIONS
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var title = ""
    @State private var caption = ""
    @State private var imagePickerPresented = false
    
    @StateObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        ZStack{
            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    // ACTION TOOLBAR
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
                    
                    // PAGE TITLE
                    LargeTitle(title: "New Recipe")
                    
                    // UPLOAD IMAGE
                    UploadImage(image: $viewModel.postImage, imagePickerPresented: $imagePickerPresented)
                    
                    // RECIPE INFO
                    UploadTextInput(placehorder: "Recipe Name", text: $title)
                    
                    UploadTextInput(placehorder: "Recipe Description", text: $caption)
                    
                    UploadTextInput(placehorder: "Preparation Time", text: $title)
                    
                    UploadTextInput(placehorder: "Number of Serving", text: $caption)
                    
                    UploadTextInput(placehorder: "Calories per Serving", text: $caption)


                    HStack (alignment: .center) {
                        Text("Ingredients")
                            .font(.title)
                            .padding(.top, 20)
                            .foregroundStyle(Color("TitleColor"))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("+")
                                .font(.title)
                                .padding(.top, 20)
                                .foregroundStyle(.customBlue)
                        }
                    }
                    
                    
                    UploadTextInput(placehorder: "Recipe Description", text: $caption)
                    
                    
                    HStack (alignment: .center) {
                        Text("Instructions")
                            .font(.title)
                            .padding(.top, 20)
                            .foregroundStyle(Color("TitleColor"))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("+")
                                .font(.title)
                                .padding(.top, 20)
                                .foregroundStyle(.customBlue)
                        }
                    }
                    
                    UploadTextInput(placehorder: "Recipe Description", text: $caption)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarBackButtonHidden(true)
            .background(Color(.background))
            .onAppear{
//                imagePickerPresented.toggle()
            }
            .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
            
            if (viewModel.isLoading) {
                LoadingScreen()
            }
        }
    }
    
    func clearDataAndCloseNewPost() {
        title = ""
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        self.presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    UploadRecipeView()
}
