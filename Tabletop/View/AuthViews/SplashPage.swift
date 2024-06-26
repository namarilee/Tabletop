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
                    Image("tabletop_logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 141)
                                      
                    Spacer()

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
        }
        .background(Color("lightPurpleBG"))
        .ignoresSafeArea()
    }
        

}

#Preview {
    SplashPage()
        .environmentObject(UserViewModel())
}
