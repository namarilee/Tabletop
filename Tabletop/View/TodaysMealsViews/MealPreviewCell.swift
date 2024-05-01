//
//  MealPreviewCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import FirebaseFirestore
import Kingfisher

struct MealPreviewCell: View {
    @EnvironmentObject var createPostViewModel: CreatePostViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    let post: MealPost
    
    func starType(index: Int) -> String {
        if let rate = post.rating {
            return index <= rate ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                NavigationLink(destination: PostDetailPage(post: post)) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .frame(width: 135, height: 135)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                VStack (alignment: .leading, spacing: 8.0) {
                    
                    Text(post.caption)
                        .font(.custom("ReadexPro-Regular", size: 14))
                    
                    HStack (spacing: 5) {
                        ForEach(0...(post.rating ?? 5), id: \.self) { index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color("ttRed"))
                                .frame(width: 20, height: 20)
                        }
                        ForEach(0..<((4 - post.rating!)), id: \.self) { index in
                            Image(systemName: "star")
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
                }
                
                
            }
            .padding(25)
        }
        .background(Color.white)
        .cornerRadius(14.0)
        
    }
}

#Preview {
    MealPreviewCell(post: MealPost(ownerUid: "123", caption: "Caption goes here", timestamp: Timestamp(), rating: 3, locationName: "The Press Cafe", imageUrl: "sample-meal"))
        .environmentObject(UserViewModel())
}
