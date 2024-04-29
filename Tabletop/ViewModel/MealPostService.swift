//
//  MealPostService.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import FirebaseFirestore

struct MealPostService {
    
//    static func uploadPost(_ post: MealPost) async throws {
//        guard let postData = try? Firestore.Encoder().encode(post) else { return }
//        try await Firestore.firestore().collection("posts").addDocument(data: postData)
//    }
    private static let postsCollection = Firestore.firestore().collection("meal_posts")
    
    static func fetchFeedPosts() async throws -> [MealPost] {
        let snapshot = try await postsCollection.getDocuments()

        var posts = try snapshot.documents.compactMap( { try $0.data(as: MealPost.self) } )
        
        // Fetch the user associated with the post
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserViewModel.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
        
    }
    
    static func fetchUserPosts(uid: String) async throws -> [MealPost] {
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap( { try $0.data(as: MealPost.self) } )
    }
    
    
}
