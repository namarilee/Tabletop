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
import FirebaseStorage
import PhotosUI
import SwiftUI

class CreatePostViewModel: ObservableObject {
    @Published var ratingSelected = false
    @Published var isImageSelected = false
    @Published var locationName = "Tap to add..."
    
    @Published var mealImage: Image?
    @Published var uiImage: UIImage?

    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    // Checks if the caption is within the char limit of 1000
    @Published var caption = "" {
        didSet {
            if caption.count >= 1000 && oldValue.count <= 1000 {
                caption = oldValue
            }
        }
    }
    
    @Published var imageUrl: String = ""
    
    @Published var rating: Int?
    
    @Published var post: MealPost?
    
    // Determines how many stars are filled or not based on the selected rating
    func starType(index: Int) -> String {
        if let rate = rating {
            return index <= rate ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
        
    // Used to determine if "Share" button is disabled
    func isUserAllowedToPost() -> Bool {
        return ratingSelected && isImageSelected && !caption.isEmpty
    }
    
   // Loads image from the photos picker item
    private func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage // Set the UIImage to the property
        self.mealImage = Image(uiImage: uiImage)
    }
    
    // Creates a post in the firebase database
    func uploadPost(caption: String) async throws {
        print("uploadPost called")
        do {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            guard let uiImage = self.uiImage else { return }
            
            let postRef = Firestore.firestore().collection("meal_posts").document()
            
            print("get collection")
            
            guard let imageUrl = try await ImageUploader.uploadImage(folderName: "meal_images", uiImage) else { return }
            
            print("imageUrl created")
            
            let post = MealPost(postId: postRef.documentID, ownerUid: uid, caption: caption, timestamp: Timestamp(), rating: rating!, locationName: locationName, imageUrl: imageUrl)
            
            print("post was created")
            
            guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
            
            try await postRef.setData(encodedPost)
            self.post = post
        } catch {
            print(error.localizedDescription)
        }
        print("end of uploadPost")
    }

}


