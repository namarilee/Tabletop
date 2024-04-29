//
//  ProfilePage.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import SwiftUI
import PhotosUI

struct ProfilePage: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    //var posts: [MealPost]
    
   let user: User
    
    var body: some View {
     //  if let user = userViewModel.currentUser {
            VStack {
                Spacer()
                    .frame(height: 50)
                Text("Profile")
                    .font(.custom("ReadexPro-Regular_SemiBold", size: 30))
                    .foregroundColor(Color("ttPurple"))
                
                PhotosPicker(selection: $userViewModel.selectedItem, matching: .images) {
                    if let image = userViewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Text(user.initials)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color("ttPurple"))
                            .clipShape(Circle())
                    }
                }
                .onDisappear {
                    Task {
                        try await userViewModel.updateUserData()
                    }
                }
                
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
                    UserDefaults.standard.set(false, forKey: "signIn")

                }
                
                PostGridView(user: user)
                
                Spacer()
            }
                .padding()
                .background(Color("lightPurpleBG"))
                .ignoresSafeArea()
            }
      // }
    }


#Preview {
    ProfilePage(user: User.MOCK_USER)
        .environmentObject(UserViewModel())

}
