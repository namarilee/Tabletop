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

    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("ttPurple"))
            Text("Sign in to your Tabletop account")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 50)
            
           
            TextField("Email", text: $email)
                .padding(10)
                .background(Color.white)
                .autocapitalization(.none)
            Spacer()
                .frame(height: 10)
            TextField("Password", text: $password)
                .padding(10)
                .background(Color.white)
          
        
            Spacer()
                .frame(height: 50)
            
            Button("Log in") {
                Task {
                    await userViewModel.signIn(email: email, password: password)
                }
            }
                .font(.title2)
                .frame(width: 311, height: 48, alignment: .center)
                .background(Color("ttBlack"))
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
}
