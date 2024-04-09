//
//  SplashPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI

struct SplashPage: View {
    @State private var email = "test@test.com"
    @State private var password = "Testing123!"
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("tabletop")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 145.0 / 255.0, green: 143.0 / 255.0, blue: 240.0 / 255.0))
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            
            Button("Create account") {
                Task {
                    await userViewModel.signUp(email: email, password: password)
                }
            }
            .disabled(email.isEmpty || password.isEmpty)
            Spacer()
        }
        .padding()
        .background(Color(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 255.0 / 255.0))

     //   .foregroundColor(Color(red: 244.0, green: 244.0, blue: 255.0, opacity: 1.0))
    }
}

#Preview {
    SplashPage()
}
