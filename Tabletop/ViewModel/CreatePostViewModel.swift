//
//  CreatePostViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/26/24.
//

import Foundation
import Combine
import Firebase
import PhotosUI
import SwiftUI

class CreatePostViewModel: ObservableObject {
    @Published var ratingSelected = false
    @Published var imageSelected = false
    @Published var locationName = "Tap to add..."
    @Published var mealImage: Image?
    

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
        return ratingSelected && imageSelected && caption.isEmpty
    }
    
    func uploadPost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let post = MealPost(ownerUid: uid, caption: caption, timestamp: Timestamp(), rating: rating, locationName: locationName)
        try await MealPostService.uploadPost(post)
    }

}


