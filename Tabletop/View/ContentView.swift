//
//  ContentView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {

    @EnvironmentObject var userViewModel: UserViewModel
    
        var body: some View {
            Group {
                if userViewModel.userSession != nil || userViewModel.isSignedInWithGoogle {
                    MainTabView()
                } else {
                    SplashPage()
                }
            }
            .environmentObject(userViewModel)
        }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
