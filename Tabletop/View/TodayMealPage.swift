//
//  TodayMealPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI

struct TodayMealPage: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ScrollView {
            VStack (alignment: .center) {
                
                Text("Today's Meals")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ttPurple"))
                
                Text("Breakfast")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .fontWeight(.bold)
                
                ZStack {
                    VStack(spacing: 10) {
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(Color("ttGreen"))
                                    .frame(width: 32.0, height: 32.0)
                                Text("Take photo")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ttGreen"))
                            }
                            .padding(50)
                        }
                        
                        
                        //.strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                        
                        .frame(width: 250.0, height: 120.0)
                        .background(Color("ttLightGreen"))
                        .border(Color("ttGreen"))
                        .cornerRadius(14.0)
                        
                        Text("2 hr, 13 min left to post")
                            .italic()
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(Color.white)
                }
                .cornerRadius(14.0)
                
                Text("Lunch")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .fontWeight(.bold)
                
                ZStack {
                    VStack(spacing: 10) {
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(Color("ttGreen"))
                                    .frame(width: 32.0, height: 32.0)
                                Text("Take photo")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ttGreen"))
                            }
                            .padding(50)
                        }
                        
                        
                        //.strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                        
                        .frame(width: 250.0, height: 120.0)
                        .background(Color("ttLightGreen"))
                        .border(Color("ttGreen"))
                        .cornerRadius(14.0)
                        
                        Text("2 hr, 13 min left to post")
                            .italic()
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(Color.white)
                }
                .cornerRadius(14.0)
                
                Text("Dinner")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .fontWeight(.bold)
                
                ZStack {
                    VStack(spacing: 10) {
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(Color("ttGreen"))
                                    .frame(width: 32.0, height: 32.0)
                                Text("Take photo")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ttGreen"))
                            }
                            .padding(50)
                        }
                        
                        
                        //.strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                        
                        .frame(width: 250.0, height: 120.0)
                        .background(Color("ttLightGreen"))
                        .border(Color("ttGreen"))
                        .cornerRadius(14.0)
                        
                        Text("2 hr, 13 min left to post")
                            .italic()
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(Color.white)
                }
                .cornerRadius(14.0)
            }
            .padding(30)
        }
        .background(Color("lightPurpleBG"))

        
    }
        
}

#Preview {
    TodayMealPage()
        .environmentObject(UserViewModel())
}
