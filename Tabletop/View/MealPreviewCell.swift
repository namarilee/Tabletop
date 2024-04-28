//
//  MealPreviewCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI

struct MealPreviewCell: View {
    @StateObject var createPostViewModel = CreatePostViewModel()

    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Image("sample-meal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                VStack (alignment: .leading, spacing: 8.0) {
                    
                    Text("First time trying this place! It was so good")
                        .font(.custom("ReadexPro-Regular", size: 14))
                    
                    HStack (spacing: 5){
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ttRed"))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ttRed"))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ttRed"))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ttRed"))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ttRed"))
                    }
                    Button {
                        
                    } label: {
                        Text("📍 \(createPostViewModel.locationName)")
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
    MealPreviewCell()
}
