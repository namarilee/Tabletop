//
//  ProfilePage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        if let user = userViewModel.currentUser {
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("Profile")
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                    .foregroundColor(Color("ttPurple"))
                Text(user.initials)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color("ttPurple"))
                    .clipShape(Circle())
                
                Text("@\(user.username)")
                    .font(.custom("ReadexPro-Regular", size: 20))
                    .foregroundColor(Color("ttBlack"))
                HStack {
                    Button("☕️ 12") {
                        
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(20)
                    
                    Button("🍳 12") {
                        
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(20)
                    
                    Button("🥘 12") {
                        
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(20)

                }
                Button("Log out") {
                    userViewModel.signOut()
                }
                Spacer()
            }
            .padding()
            .background(Color("lightPurpleBG"))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ProfilePage()
        .environmentObject(UserViewModel())

}
