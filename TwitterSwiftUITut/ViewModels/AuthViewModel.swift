//
//  AuthViewModel.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 29/01/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  
  func login() {
    
  }
  
  func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
    
//    print("DEBUG: Email is \(email)")
//    print("DEBUG: Password is \(password)")
    
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: Error \(error.localizedDescription)")
        return
      }
      
      print("DEBUG: Successfuly signed up user..")
    }
  }
}
