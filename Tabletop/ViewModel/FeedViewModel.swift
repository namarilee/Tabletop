//
//  FeedViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import Combine
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [MealPost]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        print("start of fetch posts")
        self.posts = try await MealPostService.fetchFeedPosts()
        print("end of fetch posts")

    }
}
