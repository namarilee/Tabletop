//
//  CreatePostViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/26/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import PhotosUI
import SwiftUI

class CreatePostViewModel: ObservableObject {
    @Published var ratingSelected = false
    @Published var imageSelected = false
    @Published var locationName = "Tap to add..."
    @Published var mealImage: Image?
    private var uiImage: UIImage?

    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var caption = "" {
        didSet {
            if caption.count >= 1000 && oldValue.count <= 1000 {
                caption = oldValue
            }
        }
    }
    
    @Published var rating: Int?
    
    func starType(index: Int) -> String {
        if let rate = rating {
            return index <= rate ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    func isUserAllowedToPost() -> Bool {
        return ratingSelected && imageSelected && !caption.isEmpty
    }
    
   
    private func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.mealImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(folderName: "meal_images", uiImage) else { return }
        let post = MealPost(postId: postRef.documentID, ownerUid: uid, caption: caption, timestamp: Timestamp(), rating: rating, locationName: locationName, imageUrl: imageUrl)
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }

        try await postRef.setData(encodedPost)
    }

}


