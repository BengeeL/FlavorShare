//
//  EditProfileViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var bio = ""
    
    @Published var isLoading = false

    private var uiImage: UIImage?
//    @Published var phone = ""
//    @Published var dateOfBirth = Date()
    
    init(user: User) {
        self.user = user
    
        if let bio = user.bio {
            self.bio = bio
        }

        firstName = user.firstName
        lastName = user.lastName
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserDate() async throws {
        var data = [String: Any]()

        // Update Profile Image if Changed
        if let uiImage = uiImage {
            isLoading = true
            let imageURL = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageURL"] = imageURL
            user.profileImageURL = imageURL
        }
        
        
        // Update First Name
        if (!firstName.isEmpty && user.firstName != firstName) {
            isLoading = true
            data["firstName"] = firstName
            user.firstName = firstName
        }
        
        // Update Last Name
        if (!lastName.isEmpty && user.lastName != lastName) {
            isLoading = true
            data["lastName"] = lastName
            user.lastName = lastName
        }
        
        // Update Bio
        if (user.bio != bio) {
            isLoading = true
            data["bio"] = bio
            user.bio = bio
        }
        
        // Update User Data
        if (!data.isEmpty) {
            try await FirebaseContants.UsersCollection.document(user.id).updateData(data)
            
            UserService.shared.currentUser = user
        }
        
        isLoading = false
    }
}
