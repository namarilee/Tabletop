//
//  MealPreviewCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import FirebaseFirestore

struct MealPreviewCell: View {
    @StateObject var createPostViewModel = CreatePostViewModel()
    @EnvironmentObject var userViewModel: UserViewModel
    
    let post: MealPost

    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Image(post.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .frame(width: 135, height: 135)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack (alignment: .leading, spacing: 8.0) {
                    
                    Text(post.caption)
                        .font(.custom("ReadexPro-Regular", size: 14))
                    
                    HStack (spacing: 5) {
                        ForEach(0...4, id: \.self) { index in
                            Image(systemName: createPostViewModel.starType(index: post.rating!))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color("ttRed"))
                                .frame(width: 20, height: 20)
                                
                        }
                    }
                    Button {
                        
                    } label: {
                        Text("📍 \(post.locationName)")
                            .font(.custom("ReadexPro-Regular", size: 10))
                            .lineLimit(-1)
                            .padding(7)
                            .foregroundColor(Color.white)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 20,
                                    style: .circular
                                )
                                .fill(Color("ttGreen"))
                            )
                    }
                    Text("15 likes • 4 comments")
                        .font(.custom("ReadexPro-Regular", size: 12))
                }
            }
            .padding(25)
        }
        .background(Color.white)
        .cornerRadius(14.0)
        
    }
}

#Preview {
    MealPreviewCell(post: MealPost(ownerUid: "123", caption: "a", timestamp: Timestamp(), rating: 4, locationName: "The Press Cafe", imageUrl: "sample-meal"))
        .environmentObject(UserViewModel())
}
