//
//  CreateAccountPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountPage: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("ttPurple"))
            Text("Give us a little more info to create your Tabletop account.")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 50)
            
            TextField("Create a username", text: $username)
                .padding(10)
                .background(Color.white)
            TextField("Email", text: $email)
                .padding(10)
                .background(Color.white)
            TextField("Password", text: $password)
                .padding(10)
                .background(Color.white)
            
            Spacer()
                .frame(height: 50)
            
            Button("Create account") {
                Task {
                    await userViewModel.signUp(email: email, password: password)
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
        .padding(40)
        .background(Color("lightPurpleBG"))
    }
}

#Preview {
    CreateAccountPage()
}
