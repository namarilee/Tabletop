//
//  MainTabView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/22/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        TabView {
            TodayMealPage()
            .tabItem {
                Image(systemName: "flame")
            }
            FeedPage()
            .tabItem {
                Image(systemName: "fork.knife")
            }
            ProfilePage(user: userViewModel.currentUser ?? User.MOCK_USER)
            .tabItem {
                Image(systemName: "person")
            }
        }
        .accentColor(Color("ttPurple"))


    }
}

#Preview {
    MainTabView()
        .environmentObject(UserViewModel())
}
