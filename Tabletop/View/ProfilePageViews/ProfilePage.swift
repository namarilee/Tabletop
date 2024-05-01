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
    
    
    let user: User
    
    var body: some View {
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
            
            Button("Log out") {
                userViewModel.signOut()
                UserDefaults.standard.set(false, forKey: "signIn")
                
            }
            
            ScrollView {
                    PostGridView(user: user)
            }
            Spacer()
        }
        .padding()
        .background(Color("lightPurpleBG"))
        .ignoresSafeArea()
        .onAppear() {
            Task {
                try await MealPostService.fetchUserPosts(uid: user.id!)
            }
        }
    }
}


#Preview {
    ProfilePage(user: User.MOCK_USER)
        .environmentObject(UserViewModel())
        .environmentObject(CreatePostViewModel())

}
