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
}
