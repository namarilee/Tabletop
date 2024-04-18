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
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfilePage()
            } else {
                SplashPage()
            }
        }
    }
}

#Preview {
    ContentView()
}
