//
//  TodayMealPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI
import FirebaseFirestore

struct TodayMealPage: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    @EnvironmentObject var todayMealViewModel: TodayMealViewModel
    @EnvironmentObject var createPostViewModel: CreatePostViewModel

    @State var isPostShared = false

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .center, spacing: 20) {
                    
                    Text("Today's Meals")
                        .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                        .foregroundColor(Color("ttPurple"))
                    
                
                    Text("Breakfast")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if todayMealViewModel.isPostShared {
                        if let post = createPostViewModel.post {
                            MealPreviewCell(post: post)
                        } else {
                            MealPreviewCell(post: MealPost(ownerUid: "123", caption: "First time trying this place! It was so good", timestamp: Timestamp(), rating: 4, locationName: "The Press Cafe", imageUrl: "sample-meal"))
                        }
                    } else {
                        todayMealViewModel.mealCellForTime(mealType: .breakfast)
                    }
                    
                    Text("Lunch")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                   
                    todayMealViewModel.mealCellForTime(mealType: .lunch)
                    
                    
                    Text("Dinner")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                   
                    todayMealViewModel.mealCellForTime(mealType: .dinner)
                    
                }
                .padding(.horizontal, 30)
                .onChange(of: todayMealViewModel.isPostShared) { newValue in
                    // Update local state when isPostShared changes
                    isPostShared = newValue
                }
            }
            .background(Color("lightPurpleBG"))
        }
    }
        
}

#Preview {
    TodayMealPage()
        .environmentObject(UserViewModel())
        .environmentObject(TodayMealViewModel())
}
