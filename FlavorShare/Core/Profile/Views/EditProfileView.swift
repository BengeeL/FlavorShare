//
//  EditProfileView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    // MARK: VARIABLES
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    // MARK: INIT
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    // MARK: BODY
    var body: some View {
        ZStack {
            VStack {
                // MARK: TOOLBAR
                VStack {
                    HStack {
                        Button("Cancel") {
                            dismiss()
                        }
                        .frame(width: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            Task {
                                try await viewModel.updateUserDate()
                                dismiss()
                            }
                        } label: {
                            Text("Done")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .frame(width: 100, alignment: .trailing)
                        }
                    } // HStack
                    .padding(.horizontal)
                    
                    Divider()
                } // VStack
                
                // MARK: EDIT PROFILE IMAGE
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack (spacing: 15){
                        VStack (spacing: 15) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                            } else {
                                ProfilePicture(user: viewModel.user, size: .large)
                                //                                Text("\(viewModel.user.firstName.first?.description ?? "")\(viewModel.user.lastName.first?.description ?? "")")
                                //                                    .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
                                //                                    .font(.title)
                                //                                    .fontWeight(.heavy)
                                //                                    .background(Color("TileColor"))
                                //                                    .foregroundStyle(.text)
                                //                                    .clipShape(Circle())
                                //                                    .shadow(radius: 3)
                            }
                            
                            Text("Edit Profile Picture")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.customBlue)
                        }// VStack
                        .padding(.vertical)
                        
                        Divider()
                    }// VStack
                }// PhotoPicker
                
                // MARK: EDIT INFO
                VStack {
                    // Edit First Name
                    EditFieldSetting(title: "First Name", placeholder: "John", text: $viewModel.firstName)
                    
                    // Edit Last Name
                    EditFieldSetting(title: "Last Name", placeholder: "Smith", text: $viewModel.lastName)
                    
                    
                    // Edit bio
                    EditFieldSetting(title: "Bio", placeholder: "This is my bio.", text: $viewModel.bio)
                    
                    
                    // Edit phone
                    //                EditFieldSetting(title: "Phone", placeholder: "123", text: $firstName)
                    
                    
                    // dateOfBirth
                    //                EditFieldSetting(title: "Date of Birth", placeholder: "John", text: $firstName)
                }
                
                Spacer()
            } // VStack
            
            if (viewModel.isLoading) {
                LoadingScreen()
            }
        } // ZStack
    } // Body
} // Struct

#Preview {
    EditProfileView(user: DeveloperPreview.users[0])
}
