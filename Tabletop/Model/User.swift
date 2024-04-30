//
//  User.swift
//  Tabletop
//
//  Created by Marina Lee on 4/10/24.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var userEmail: String
    var imageUrl: String?
    
    // Gets the initials of a username for the default profile picture
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: username) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

// Mock user for testing
extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, username: "leemarina", userEmail: "mhlee@usc.edu")
}
