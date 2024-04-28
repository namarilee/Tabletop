//
//  FeedPreviewCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI

struct FeedPreviewCell: View {
    @StateObject var createPostViewModel = CreatePostViewModel()
    let post: MealPost
    
    var body: some View {
        //post.mealImage
        Text("")
    }
}

// Enables us to use display the mock post
struct FeedPreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedPreviewCell(post: DeveloperPreview.MOCK_POST)
    }
}
