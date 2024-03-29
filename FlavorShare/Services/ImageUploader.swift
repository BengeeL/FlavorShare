//
//  ImageUploader.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print(" DEBUG: ImageUploader - uploadIMage(): Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
