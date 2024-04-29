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
    
    private func passwordsMatch() -> Bool {
        return password == confirmPassword
    }

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
            
            TextField("Confirm Password", text: $confirmPassword)

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
                .background(username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || !passwordsMatch() ? Color("ttGray") : Color("ttBlack"))
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .disabled(username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || !passwordsMatch())
        Spacer()
        }
        .padding(50)
        .background(Color("lightPurpleBG"))
    }
}

struct MyTextField: UIViewRepresentable {

    @Binding var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Confirm password",
            attributes: [
                .foregroundColor: Color("ttRedLighter")
            ]
        )
        textField.delegate = context.coordinator

        return textField
    }

    // Updating data from SwiftUI > UIKit
    func updateUIView(_ textField: UITextField, context: Context) {
        textField.text = text
    }

    // Getting data from SwiftUI to UIKit
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    // Updating data From UIKit > SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            self._text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

    }


}

#Preview {
    CreateAccountPage()
        .environmentObject(UserViewModel())
       
}

//struct MyTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTextField(text: .constant(""))
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
