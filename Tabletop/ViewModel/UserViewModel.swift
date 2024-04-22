//
//  UserViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/8/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

@MainActor
class UserViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    func signUp(email: String, password: String, username: String) async {
           do {
               let result = try await Auth.auth().createUser(
                   withEmail: email,
                   password: password
               )
               self.userSession = result.user
               let user = User(id: result.user.uid, username: username, userEmail: email)
               let userId = result.user.uid
               let email = result.user.email
               print("userId \(userId) email \(email)")
               
               let encodedUser = try Firestore.Encoder().encode(user)
               // Create the document in firestore
               try await Firestore.firestore().collection("users").document(userId).setData(encodedUser)
               await fetchUser()
           } catch {
               print(error)
           }
       }

       func signIn(email: String, password: String) async {
           do {
               let result = try await Auth.auth().signIn(
                   withEmail: email,
                   password: password
               )
               self.userSession = result.user
               await fetchUser()
               let userId = result.user.uid
               let email = result.user.email
               print("userId \(userId) email \(email)")
           } catch {
               print(error)
           }
       }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print(error)
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: Current user is \(self.currentUser)")
    }
}
