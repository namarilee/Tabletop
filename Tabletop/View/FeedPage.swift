//
//  FeedPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/22/24.
//

import SwiftUI
import FirebaseFirestore

struct FeedPage: View {
    @EnvironmentObject var feedViewModel: FeedViewModel
    
    let items: [GridItem] = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    
    var body: some View {
        ScrollView {
            
            Text("My Feed")
                .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                .foregroundColor(Color("ttPurple"))
            
            LazyVGrid(columns: items, spacing: 7) {
                ForEach(feedViewModel.posts) { post in
                    FeedPreviewCell(post: post)
                }
                
            }
        }
        .background(Color("lightPurpleBG"))

        .onAppear() {
            Task {
                try await feedViewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    FeedPage()
        .environmentObject(FeedViewModel())
}
