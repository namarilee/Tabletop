//
//  SignInPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import SwiftUI

struct SignInPage: View {
    @State private var email = ""
    @State private var password = ""

    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome back!")
                .font(.custom("ReadexPro-Regular_SemiBold", size: 35))
                .foregroundColor(Color("ttPurple"))
            Text("Sign in to your Tabletop account")
                .font(Font.custom("ReadexPro-Regular_Light", size: 20))
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 50)
            
           
            TextField("Email", text: $email)
                .font(Font.custom("ReadexPro-Regular_Light", size: 16))
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .autocapitalization(.none)
            
            Spacer()
                .frame(height: 10)
            
            TextField("Password", text: $password)
                .font(Font.custom("ReadexPro-Regular_Light", size: 16))
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .autocapitalization(.none)

        
            Spacer()
                .frame(height: 50)
            
            Button("Log in") {
                Task {
                    await userViewModel.signIn(email: email, password: password)
                }
            }
                .font(Font.custom("ReadexPro-Regular_Medium", size: 24))
                .frame(width: 311, height: 48, alignment: .center)
                .background(email.isEmpty || password.isEmpty ? Color("ttGray") : Color("ttBlack"))
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .disabled(email.isEmpty || password.isEmpty)

            
            Spacer()
        }
        .padding(50)
        .background(Color("lightPurpleBG"))
    }
}

#Preview {
    SignInPage()
        .environmentObject(UserViewModel())
}
