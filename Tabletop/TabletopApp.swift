//
//  TabletopApp.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

//      for family in UIFont.familyNames.sorted() {
//          let names = UIFont.fontNames(forFamilyName: family)
//          print("Family: \(family) Font names: \(names)")
//      }
    return true
  }
}


@main
struct TabletopApp: App {
    @StateObject var userViewModel = UserViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
               .environmentObject(userViewModel)
        }
    }
}
