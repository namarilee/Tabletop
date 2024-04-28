//
//  PreviewProvider.swift
//  Tabletop
//
//  Created by Marina Lee on 4/27/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}
// Mock post for testing
class DeveloperPreview {
    static let shared = DeveloperPreview()
    static var MOCK_POST = MealPost(ownerUid: "123", caption: "First time trying this place! It was so good", timestamp: Timestamp(), rating: 5, locationName: "The Press Cafe")
}
