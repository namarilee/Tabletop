//
//  PostGridViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/28/24.
//

import Foundation
import Combine

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [MealPost]()
    
    init(user: User) {
        self.user = user
        
        Task  {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await MealPostService.fetchUserPosts(uid: user.id!)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
