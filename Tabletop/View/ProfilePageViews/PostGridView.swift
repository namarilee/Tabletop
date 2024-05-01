//
//  PostGridView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/28/24.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var postGridViewModel: PostGridViewModel
    
    init(user: User) {
        self._postGridViewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    let items: [GridItem] = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 10) {
            ForEach(postGridViewModel.posts) { post in
                NavigationLink(destination: PostDetailPage(post: post)) {
                    
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .frame(width: 162, height: 198)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }
}
#Preview {
    PostGridView(user: User.MOCK_USER)
        .environmentObject(CreatePostViewModel())

}
