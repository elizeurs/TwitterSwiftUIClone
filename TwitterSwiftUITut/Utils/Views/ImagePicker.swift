//
//  ImagePicker.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 29/01/21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    let picker = UIImagePickerController()
    return  picker
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

extension ImagePicker {
  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let  parent: ImagePicker
    
    init(_ parent: ImagePicker) {
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
    }
  }
}
