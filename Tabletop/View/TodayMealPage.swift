//
//  TodayMealPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI

struct TodayMealPage: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject var todayMealViewModel = TodayMealViewModel()
    
    // Function to determine which cell to display based on current time
    func mealCellForTime(mealType: MealType) -> some View {
        let now = Calendar.current.component(.hour, from: Date())
        
        let mealStartTime: Int
            
        switch mealType {
            case .breakfast:
                mealStartTime = 6
            case .lunch:
                mealStartTime = 11
            case .dinner:
                mealStartTime = 17
        }
        
        if now >= mealStartTime {
            return AnyView(AddMealCell())
        } else {
            return AnyView(NotTimeYetCell(mealType: mealType))
        }
    }
    
    
    
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
                    
                    
                    mealCellForTime(mealType: .breakfast)

                    Text("Lunch")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    mealCellForTime(mealType: .lunch)

                    Text("Dinner")
                        .font(.custom("ReadexPro-Regular_Medium", size: 20))
                        .foregroundColor(Color("ttBlack"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    mealCellForTime(mealType: .dinner)
                }
                .padding(.horizontal, 30)
            }
            .background(Color("lightPurpleBG"))
            
            
        }
    }
        
}

#Preview {
    TodayMealPage()
        .environmentObject(UserViewModel())
}
