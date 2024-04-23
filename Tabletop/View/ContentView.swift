//
//  ContentView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
//    var isLoggedIn: Bool {
//            Auth.auth().currentUser == nil
//    }
    @EnvironmentObject var viewModel: UserViewModel
    
        
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
                
            } else {
                SplashPage()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
