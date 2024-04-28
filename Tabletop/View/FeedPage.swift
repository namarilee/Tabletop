//
//  FeedPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/22/24.
//

import SwiftUI
import FirebaseFirestore

struct FeedPage: View {
    @StateObject var feedViewModel = FeedViewModel()
    
    let items: [GridItem] = [
            GridItem(.flexible(minimum: 120)),
            GridItem(.flexible(minimum: 120))
        ]
    
    var body: some View {
        Text("My Feed")
            .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
            .foregroundColor(Color("ttPurple"))
        ScrollView(.vertical) {
            LazyVGrid(columns: items, spacing: 10) {
                ForEach(0...10, id: \.self) { post in
                    FeedPreviewCell(post: MealPost(ownerUid: "123", caption: "asdf", timestamp: Timestamp(), locationName: "", imageUrl: "sample-meal"))                                }
            }
                            //.padding()
           
        }
        .padding()
        .background(Color("lightPurpleBG"))
        .ignoresSafeArea()
    }
}

#Preview {
    FeedPage()
}
