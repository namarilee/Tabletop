//
//  NotTimeYetCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI

enum MealType {
    case breakfast
    case lunch
    case dinner
}


struct NotTimeYetCell: View {
    @EnvironmentObject var todayMealViewModel: TodayMealViewModel

    let mealType: MealType
    
    var mealStartTime: Int { // Get the respective meal's start time
        switch mealType {
            case .breakfast:
                return 6
            case .lunch:
                return 11
            case .dinner:
                return 17
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(red: 232.0 / 255.0, green: 232.0 / 255.0, blue: 232.0 / 255.0))
                        .frame(width: 270.0, height: 120.0)
                    
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "clock")
                                .resizable()
                                .foregroundColor(Color("ttBlack"))
                                .frame(width: 32.0, height: 32.0)
                            Text("It's not time yet!")
                                .font(.custom("ReadexPro-Regular_Medium", size: 22))
                                .foregroundColor(Color("ttBlack"))
                        }
                        .padding(.vertical, 20)
                    }
                }
                Text(todayMealViewModel.timeUntilMealStart(mealType: mealType))
                    .font(.custom("ReadexPro-Regular_Light", size: 14))
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(Color.white)
        }
        .cornerRadius(14.0)
    }
}

#Preview {
    NotTimeYetCell(mealType: .breakfast)
}
