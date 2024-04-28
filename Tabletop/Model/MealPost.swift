//
//  MealPost.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI

struct MealPost: Identifiable, Codable {
    
    @DocumentID var postId: String?
    let ownerUid: String
    var caption: String
    let timestamp: Timestamp
    var rating: Int?
    var locationName: String
   // var mealImage: Image?
    var imageUrl: String?
    
    var id: String {
        return postId ?? NSUUID().uuidString
    }
    
    var user: User?
}

// Converting UIImage to a codable property
struct MealImage: Codable {
    let imageData: Data?
    
    init(withImage image: UIImage) {
        self.imageData = image.pngData()
    }
    func getImage() -> UIImage? {
        guard let imageData = self.imageData else {
            return nil
        }
        let image = UIImage(data: imageData)
        
        return image
    }
}


