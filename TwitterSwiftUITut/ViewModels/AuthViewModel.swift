//
//  AuthViewModel.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 29/01/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  @Published var userSession: FirebaseAuth.User?
  @Published var isAuthenticating = false
  @Published var error: Error?
  @Published var user: User?
  
  static let shared = AuthViewModel()
  
  init() {
    userSession = Auth.auth().currentUser
    fetchUser()
  }
  
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if let  error = error {
        print("DEBUG: Failed to login: \(error.localizedDescription)")
        return
      }
      
      print("DEBUG: Successfully logged in")
      
      self.userSession = result?.user
      self.fetchUser()
    }
  }
  
  func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
    
    //    print("DEBUG: Email is \(email)")
    //    print("DEBUG: Password is \(password)")
    
    //      print("DEBUG: Successfuly signed up user..")
    
    guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
    let filename = NSUUID().uuidString
    let storageRef = Storage.storage().reference().child(filename)
    
    storageRef.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("DEBUG: Failed to upload image \(error.localizedDescription)")
        return
      }
      
//      print("DEBUG: Successfully uploaded user photo..")
      
      storageRef.downloadURL { url, _ in
        guard let profileImageUrl = url?.absoluteString else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
          if let error = error {
            print("DEBUG: Error \(error.localizedDescription)")
            return
          }
          
          guard let user = result?.user else { return }
          
          let data = ["email": email,
                      "username": username.lowercased(),
                      "fullname": fullname,
                      "profileImageUrl": profileImageUrl,
                      "uid": user.uid]
          
          Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            print("DEBUG: Successfully uploaded user data..")
            self.userSession = user
            self.fetchUser()
          }
        }
      }
    }
  }
  
  func signOut() {
    userSession = nil
    user = nil
    try? Auth.auth().signOut()
  }
  
  func fetchUser() {
    guard let uid  = userSession?.uid else { return }
    
    Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
      guard let data = snapshot?.data() else { return }
//        let user = User(dictionary: data)
//        print("DEBUG: User is \(user.username)")
      self.user = User(dictionary: data)
      }
    }
  
  func tabTitle(forIndex index: Int) -> String {
    switch index {
    case 0: return "Home"
    case 1: return "Search"
    case 2: return "Messages"
    default: return ""
    }
  }
  }

