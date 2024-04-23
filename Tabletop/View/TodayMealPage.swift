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
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                    .foregroundColor(Color("ttPurple"))
                
                Text("Breakfast")
                    .font(.custom("ReadexPro-Regular_Medium", size: 20))
                    .foregroundColor(Color("ttBlack"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
                
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
                                    Text("📍 The Press Cafe")
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
                
                Text("Lunch")
                    .font(.custom("ReadexPro-Regular_Medium", size: 20))
                    .foregroundColor(Color("ttBlack"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    VStack(spacing: 10) {
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(Color("ttGreen"))
                                    .frame(width: 32.0, height: 32.0)
                                Text("Take photo")
                                    .font(.custom("ReadexPro-Regular_Medium", size: 22))
                                    .foregroundColor(Color("ttGreen"))
                            }
                            .padding(50)
                        }
                        
                        
                        
                        .frame(width: 270.0, height: 120.0)
                        .background(Color("ttLightGreen"))
                        .cornerRadius(14.0)
                        
                        Text("2 hr, 13 min left to post")
                            .font(.custom("ReadexPro-Regular_Light", size: 14))

                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(Color.white)
                }
                .cornerRadius(14.0)
                
                Text("Dinner")
                    .font(.custom("ReadexPro-Regular_Medium", size: 20))
                    .foregroundColor(Color("ttBlack"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    VStack(spacing: 10) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color(red: 232.0 / 255.0, green: 232.0 / 255.0, blue: 232.0 / 255.0))

                            //    .strokeBorder(Color(red: 84.0 / 255.0, green: 84.0 / 255.0, blue: 84.0 / 255.0))
                            //    .strokeBorder(color: Color(red: 84.0 / 255.0, green: 84.0 / 255.0, blue: 84.0 / 255.0), style: StrokeStyle(lineWidth: 1, dash: [8]))



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
                        

                        Text("Come back in 4 hr, 28 min")
                            .font(.custom("ReadexPro-Regular_Light", size: 14))

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
