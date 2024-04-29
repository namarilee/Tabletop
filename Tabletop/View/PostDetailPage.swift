//
//  PostDetailPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/29/24.
//

import SwiftUI
import FirebaseFirestore
import Kingfisher

struct PostDetailPage: View {
    @StateObject var createPostViewModel = CreatePostViewModel()
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
        ScrollView {
            VStack (spacing: 20) {
                Text("@\(post.user?.username ?? "")")
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 20))
                    .foregroundColor(Color("ttPurple"))
                //KFImage(URL(string: post.imageUrl))
                Image(post.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .frame(width: 300, height: 396)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Button {
                    
                } label: {
                    Text("📍 \(post.locationName)")
                        .font(.custom("ReadexPro-Regular", size: 16))
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
                HStack (spacing: 5) {
                    ForEach(0...4, id: \.self) { index in
                        Image(systemName: starType(index: post.rating!))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color("ttRed"))
                            .frame(width: 40, height: 40)
                        
                    }
                }
                Text(post.caption)
                    .font(.custom("ReadexPro-Regular", size: 18))
                    .multilineTextAlignment(.center)
            }
            .padding(50)
        }
        .background(Color("lightPurpleBG"))
    }
}

#Preview {
    PostDetailPage(post: MealPost(ownerUid: "123", caption: "First time trying this place! It was so good", timestamp: Timestamp(), rating: 4, locationName: "The Press Cafe", imageUrl: "sample-meal"))
        .environmentObject(UserViewModel())
    
}
