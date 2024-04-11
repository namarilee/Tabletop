//
//  ContentView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        Group {
            if userViewModel.userSession != nil {
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
