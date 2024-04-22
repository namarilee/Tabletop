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
            VStack (alignment: .center, spacing: 20) {
                
                Text("Today's Meals")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ttPurple"))
                
                Text("Breakfast")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .fontWeight(.bold)
                
                ZStack {
                    HStack(spacing: 20) {
                        Image("sample-meal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                        VStack (alignment: .leading, spacing: 8.0) {
                           
                            Text("First time trying this place! It was so good")
                                .font(.footnote)
                                .fontWeight(.semibold)
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
                                    Text("📍 The Press Cafe")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .lineLimit(-1)
                                        .padding(8)
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
                                .font(.caption)
                        }
                    }
                    .padding(25)
                }
                .background(Color.white)
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
            .padding(.horizontal, 30)
        }
        .background(Color("lightPurpleBG"))

        
    }
        
}

#Preview {
    TodayMealPage()
        .environmentObject(UserViewModel())
}
