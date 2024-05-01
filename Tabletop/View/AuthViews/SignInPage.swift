//
//  SignInPage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore

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
                .frame(height: 20)
            
            Text("or")
                .font(Font.custom("ReadexPro-Regular_Light", size: 16))
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 20)
            
            GoogleSignInButton {
                guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                // Create Google Sign In configuration object.
                let config = GIDConfiguration(clientID: clientID)
                GIDSignIn.sharedInstance.configuration = config

                // Start the sign in flow!
                GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                  guard error == nil else {
                      return
                  }

                  guard let user = result?.user,
                    let idToken = user.idToken?.tokenString
                  else {
                      return
                  }

                  let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

                    Auth.auth().signIn(with: credential) { result, error in
                        guard error == nil else {
                            return
                        }
                        // load the current user for the user view model
                        userViewModel.isSignedInWithGoogle = true
                    }
                }
            }
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
