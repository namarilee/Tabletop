//
//  ProfilePage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import SwiftUI

struct ProfilePage: View {
    @StateObject var userViewModel = UserViewModel()

    var body: some View {
        if let user = userViewModel.currentUser {
            VStack {
                Text(user.initials)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color("ttPurple"))
                    .clipShape(Circle())
                
                Text(user.username)
                HStack {
                    Button("☕️ 12") {
                        
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(20)
                    
                    Button("🥙 12") {
                        
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
            }
            .background(Color("lightPurpleBG"))
        }
    }
}

#Preview {
    ProfilePage()
}
