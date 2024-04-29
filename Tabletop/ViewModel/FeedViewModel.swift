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
        self.posts = try await MealPostService.fetchFeedPosts()
    }
}
