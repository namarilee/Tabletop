//
//  CreatePostViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/26/24.
//

import Foundation
import Combine
import Firebase

class CreatePostViewModel: ObservableObject {
    @Published var ratingSelected = false
    @Published var imageSelected = false
    @Published var locationName = "Tap to add..."
    
    func isUserAllowedToPost() -> Bool {
        return ratingSelected && imageSelected /*&& !TFManager().caption.isEmpty*/
    }
    
    func uploadPost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let post = MealPost(ownerUid: uid, caption: TFManager().caption, timestamp: Timestamp(), rating: 0)
        try await MealPostService.uploadPost(post)
    }

}

class TFManager: ObservableObject {
    @Published var caption = "" {
        didSet {
            if caption.count >= 1000 && oldValue.count <= 1000 {
                caption = oldValue
            }
        }
    }
}
