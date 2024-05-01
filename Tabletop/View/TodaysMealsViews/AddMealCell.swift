//
//  AddMealCell.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import SwiftUI

struct AddMealCell: View {
    @EnvironmentObject var todayMealViewModel: TodayMealViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                NavigationLink(destination: CreatePostPage(isPostShared: .constant(false))) {
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("ttGreen"))
                            .frame(width: 32.0, height: 32.0)
                        Text("Add meal")
                            .font(.custom("ReadexPro-Regular_Medium", size: 22))
                            .foregroundColor(Color("ttGreen"))
                    }
                    .padding(50)
                }
                
                
                
                .frame(width: 270.0, height: 120.0)
                .background(Color("ttLightGreen"))
                .cornerRadius(14.0)
                
                Text(todayMealViewModel.timeUntilMidnight())
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
    AddMealCell()
}
