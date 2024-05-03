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
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    let rating: Int?
    var locationName: String
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

// Allows timestamp to conform to comparable (used in FeedPage to display posts in descending order)
extension Timestamp: Comparable {
    public static func < (lhs: Timestamp, rhs: Timestamp) -> Bool {
        return lhs.seconds < rhs.seconds || (lhs.seconds == rhs.seconds && lhs.nanoseconds < rhs.nanoseconds)
    }
    
    public static func == (lhs: Timestamp, rhs: Timestamp) -> Bool {
        return lhs.seconds == rhs.seconds && lhs.nanoseconds == rhs.nanoseconds
    }
}


