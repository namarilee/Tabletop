//
//  FeedPreviewCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import FirebaseFirestore

struct FeedPreviewCell: View {
    @StateObject var createPostViewModel = CreatePostViewModel()
    @EnvironmentObject var userViewModel: UserViewModel

    let post: MealPost
    
    var body: some View {
        if let user = post.user {
            if let imageUrl = user.imageUrl, !imageUrl.isEmpty {
                Image(imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Text(user.initials)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color("ttPurple"))
                    .clipShape(Circle())
            }
            Text("\(post.user?.username ?? "")")

        }
        
           
            
        
        VStack (spacing: -1) {
            Image(post.imageUrl!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                .frame(width: 162, height: 198)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text("username")
                .font(.custom("ReadexPro-Regular_SemiBold", size: 20))
                .foregroundColor(Color("ttPurple"))
            
        }
            
        
        
    }
}

#Preview {
    FeedPreviewCell(post: MealPost(ownerUid: "123", caption: "asdf", timestamp: Timestamp(), locationName: "", imageUrl: "sample-meal"))
        .environmentObject(UserViewModel())
}

// Enables us to use display the mock post
//struct FeedPreviewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedPreviewCell(post: DeveloperPreview.MOCK_POST)
//            .environmentObject(UserViewModel())
//
//    }
//}
