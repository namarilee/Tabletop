//
//  TodayMealPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI

struct TodayMealPage: View {
    @StateObject var userViewModel = UserViewModel()

    var body: some View {
        VStack {
            Text("Today's Meals")
                .font(.title)
                .foregroundColor(Color("ttPurple"))
                
        }
        .background(Color("lightPurpleBG"))
    }
}

#Preview {
    TodayMealPage()
}
