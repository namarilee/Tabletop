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
                        .font(Font.custom("ReadexPro", size: 50))
                        .fontWeight(.medium)
                        .foregroundColor(Color("ttPurple"))
                    
                    
                    Spacer()
                    NavigationLink(destination: CreateAccountPage()) {
                        Text("Get started")
                            .font(Font.custom("ReadexPro", size: 20))

                            .font(.title2)
                            .frame(width: 311, height: 48, alignment: .center)
                            .background(Color("ttBlack"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text("Already have an account?")
                    NavigationLink(destination: SignInPage()) {
                        Text("Sign in")
                            .font(.title3)
                            .frame(width: 136, height: 33, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .cornerRadius(13)
                    }
                    
                    
                    Spacer()
                }
            }
            //.padding()
        }
        .background(Color("lightPurpleBG"))
        .ignoresSafeArea()
    }
        

}

#Preview {
    SplashPage()
}
