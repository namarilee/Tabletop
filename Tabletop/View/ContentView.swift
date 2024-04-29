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
    
    @State var isSignIn: Bool = UserDefaults.standard.bool(forKey: "isSignIn")

        var body: some View {
            Group {
                if userViewModel.userSession != nil || isSignIn {
                    MainTabView()
                } else {
                    SplashPage()
                }
            }
            .environmentObject(userViewModel)
//            .onReceive(NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification)) { _ in
//                        self.isSignIn = UserDefaults.standard.bool(forKey: "signIn")
//                    }
        }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
