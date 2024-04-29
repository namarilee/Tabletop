//
//  TabletopApp.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

    
        return true
    }
    
    // For Google sign in
    @available(iOS 9.0, *)
    func application(_ application: UIApplication,
                     open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        
        
        return GIDSignIn.sharedInstance.handle(url)
    }
}


@main
struct TabletopApp: App {
    @StateObject var userViewModel = UserViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("signIn") var isSignIn = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserViewModel())
            }
        }
    }


// Debug font names
//      for family in UIFont.familyNames.sorted() {
//          let names = UIFont.fontNames(forFamilyName: family)
//          print("Family: \(family) Font names: \(names)")
//      }
