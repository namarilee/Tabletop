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
import PhotosUI
import SwiftUI


@MainActor
class UserViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    @Published var profileImage: Image?
    
    private var uiImage: UIImage?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            try await fetchCurrentUser()
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
               try await fetchCurrentUser()
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
               try await fetchCurrentUser()
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
    
    // For fetching a user for a post
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func fetchCurrentUser() async throws {
        self.userSession = Auth.auth().currentUser
        guard let uid = userSession?.uid else { return }
        self.currentUser = try await UserViewModel.fetchUser(withUid: uid)
        print("DEBUG: Current user is \(self.currentUser)")
    }
    
    
    
    func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap( { try? $0.data(as: User.self) } )
        return users.filter({ $0.id != currentUid })
    }
    
    func updateUserData() async throws {
        print("DEBUG: update user data")
        try await updateProfileImage()
        
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(folderName: "profile_images", image) else { return }
        try await updateUserProfileImage(withImageUrl: imageUrl)
    }
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.imageUrl = imageUrl
    }
}
