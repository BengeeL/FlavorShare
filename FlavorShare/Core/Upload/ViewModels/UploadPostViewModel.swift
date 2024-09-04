//
//  UploadPostViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    // MARK: VARIABLES
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var postImage: Image?
    @Published var isLoading = false

    private var uiImage: UIImage?
    
    // MARK: FUNCTIONS
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(title: String, caption: String) async throws {
        isLoading = true
        let titleCleaned = String.cleanString(title)
        let captionCleaned = String.cleanString(caption)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            isLoading = false
            return
        }
        guard let uiImage = uiImage else { return }
        
        let postRef = FirebaseContants.PostsCollection.document()
        guard let imageURL = try await ImageUploader.uploadImage(image: uiImage) else {
            isLoading = false
            return
        }
        
        let post = Post(id: postRef.documentID, ownerUid: uid, title: titleCleaned, caption: captionCleaned, imageURL: imageURL, timestamp: Timestamp(), likes: 0)
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {
            isLoading = false
            return
        }
        
        try await postRef.setData(encodedPost)
        
        isLoading = false
    }
}
