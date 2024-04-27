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
    @State private var confirmPassword = ""

    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome!")
                .font(.custom("ReadexPro-Regular_SemiBold", size: 40))

                .foregroundColor(Color("ttPurple"))
            Text("Give us a little more info to create your Tabletop account.")
                .font(Font.custom("ReadexPro-Regular_Light", size: 20))
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 50)
            
            TextField("Create a username", text: $username)
                .font(Font.custom("ReadexPro-Regular_Light", size: 16))
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .autocapitalization(.none)

            Spacer()
                .frame(height: 10)
            
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
                .frame(height: 10)
            
            TextField("Confirm password", text: $confirmPassword)
                .font(Font.custom("ReadexPro-Regular_Light", size: 16))
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .autocapitalization(.none)

            
        
            Spacer()
                .frame(height: 50)
            
            Button("Create account") {
                Task {
                    await userViewModel.signUp(email: email, password: password, username: username)
                }
            }
                .font(Font.custom("ReadexPro-Regular_Medium", size: 24))
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
    CreateAccountPage()
        .environmentObject(UserViewModel())
}
