//
//  MealPost.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import FirebaseFirestore

struct MealPost: Identifiable, Codable {
    @DocumentID var postId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var rating: Int
    
    var id: String {
        return postId ?? NSUUID().uuidString
    }
    
    var user: User?
}
