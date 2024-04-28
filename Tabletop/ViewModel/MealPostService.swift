//
//  MealPostService.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import FirebaseFirestore

struct MealPostService {
    
    static func uploadPost(_ post: MealPost) async throws {
        guard let postData = try? Firestore.Encoder().encode(post) else { return }
        try await Firestore.firestore().collection("posts").addDocument(data: postData)
    }
    
    static func fetchPosts() async throws -> [MealPost] {
        let snapshot = try await Firestore.firestore().collection("posts").order(by: "timestamp", descending: true).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: MealPost.self) })
    }
}
