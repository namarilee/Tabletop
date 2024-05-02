//
//  ImagePickerView.swift
//  Tabletop
//
//  Created by Marina Lee on 4/28/24.
//

import SwiftUI

// UIKit integration of photos picker
struct ImagePickerView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var didSelectImage: (UIImage) -> Void // Closure to handle selected image
    
    // Creates and configures the UIImagePickerController
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator // Set the coordinator as the delegate
        return imagePicker
    }
    
    // Updates the UIImagePickerController
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
    
    // Creates the coordinator object to manage the UIImagePickerController
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator class to handle delegate methods of UIImagePickerController
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        // Called when the user selects an image from the UIImagePickerController
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.didSelectImage(image) // Pass selected image to closure
            }
            parent.presentationMode.wrappedValue.dismiss() // Dismiss the UIImagePickerController
        }
    }
}
