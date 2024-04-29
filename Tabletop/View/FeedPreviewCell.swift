//
//  FeedPreviewCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI
import FirebaseFirestore
import Kingfisher

struct FeedPreviewCell: View {
    @StateObject var createPostViewModel = CreatePostViewModel()
    @EnvironmentObject var userViewModel: UserViewModel

    let post: MealPost
    
    var body: some View {
      //  if post.user != nil {
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                .frame(width: 162, height: 198)
                .clipShape(RoundedRectangle(cornerRadius: 20))
//            Text("\(post.user?.username ?? "")")
//                .font(.custom("ReadexPro-Regular_SemiBold", size: 20))
//                .foregroundColor(Color("ttPurple"))
       // }
        
           
            
        
//        VStack (spacing: -1) {
//            Image(post.imageUrl)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .cornerRadius(20)
//                .frame(width: 162, height: 198)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//            
//            Text(post.user!.username)
//                .font(.custom("ReadexPro-Regular_SemiBold", size: 20))
//                .foregroundColor(Color("ttPurple"))
//            
//        }
            
        
        
    }
}

#Preview {
    FeedPreviewCell(post: MealPost(ownerUid: "123", caption: "asdf", timestamp: Timestamp(), rating: 4, locationName: "", imageUrl: "sample-meal"))
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
