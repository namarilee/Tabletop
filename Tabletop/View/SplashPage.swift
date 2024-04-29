//
//  SplashPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI

struct SplashPage: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("lightPurpleBG").ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("tabletop")
                        .font(.custom("ReadexPro-Regular_Bold", size: 50))
                        .foregroundColor(Color("ttPurple"))
                    
                    
                    Spacer()
//                    NavigationLink(value: "create_caccount") {
//                        Text("Get started")
//                            .font(Font.custom("ReadexPro-Regular_Medium", size: 25))
//
//                            .font(.title2)
//                            .frame(width: 311, height: 48, alignment: .center)
//                            .background(Color("ttBlack"))
//                            .foregroundColor(Color.white)
//                            .cornerRadius(20)
//                    }
                    
                    NavigationLink(destination: CreateAccountPage()) {
                        Text("Get started")
                            .font(Font.custom("ReadexPro-Regular_Medium", size: 25))

                            .font(.title2)
                            .frame(width: 311, height: 48, alignment: .center)
                            .background(Color("ttBlack"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Already have an account?")
                        .font(Font.custom("ReadexPro-Regular_Light", size: 16))

                    NavigationLink(destination: SignInPage()) {
                        Text("Sign in")
                            .font(Font.custom("ReadexPro-Regular_Medium", size: 18))
                            .frame(width: 136, height: 33, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .cornerRadius(13)
                    }
                    
                    
                    Spacer()
                }
            }
//            .navigationDestination(for: String.self) {
//                if $0 == "create_accunt" {
//                    CreateAccountPage()
//                }
//            }
            //.padding()
        }
        .background(Color("lightPurpleBG"))
        .ignoresSafeArea()
    }
        

}

#Preview {
    SplashPage()
        .environmentObject(UserViewModel())
}
