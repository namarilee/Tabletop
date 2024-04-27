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
                Label("", systemImage: "flame")
            }
            FeedPage()
            .tabItem {
                Label("", systemImage: "fork.knife")
            }
            ProfilePage()
            .tabItem {
                Label("", systemImage: "person")
            }
        }
        .accentColor(Color("ttPurple"))


    }
}

#Preview {
    MainTabView()
        .environmentObject(UserViewModel())
}
