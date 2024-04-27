//
//  CreatePostViewModel.swift
//  Tabletop
//
//  Created by Marina Lee on 4/26/24.
//

import Foundation
import Combine

class CreatePostViewModel: ObservableObject {
    @Published var ratingSelected = false
    @Published var imageSelected = false
}

class TFManager: ObservableObject {
    @Published var caption = "" {
        didSet {
            if caption.count >= 1000 && oldValue.count <= 1000 {
                caption = oldValue
            }
        }
    }
}
