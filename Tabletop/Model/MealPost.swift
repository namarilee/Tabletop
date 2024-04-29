//
//  MealPost.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI

struct MealPost: Identifiable, Hashable, Codable {
    
    @DocumentID var postId: String?
    //let id: String
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    let rating: Int?
    var locationName: String
   // var mealImage: Image?
    let imageUrl: String
    
    var id: String {
        return postId ?? NSUUID().uuidString
    }
    
    var user: User?
    
    static func == (lhs: MealPost, rhs: MealPost) -> Bool {
                return lhs.id == rhs.id
    }
        
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
    }
}

// Converting UIImage to a codable property
//struct MealImage: Codable {
//    let imageData: Data?
//    
//    init(withImage image: UIImage) {
//        self.imageData = image.pngData()
//    }
//    func getImage() -> UIImage? {
//        guard let imageData = self.imageData else {
//            return nil
//        }
//        let image = UIImage(data: imageData)
//        
//        return image
//    }
//}


