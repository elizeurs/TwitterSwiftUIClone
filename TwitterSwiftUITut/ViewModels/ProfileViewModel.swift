//
//  ProfileViewModel.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 31/01/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
  let user: User
  @Published var isFollowed = false
  
  init(user: User) {
    self.user = user
    checkIfUserIsFollowed()
  }
  
  func follow() {
    guard let  currentUid =  Auth.auth().currentUser?.uid else { return }
    let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
    let followerRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
    
    followingRef.document(user.id).setData([:]) { _ in
      followerRef.document(currentUid).setData([:]) { _ in
        self.isFollowed = true
      }
    }
  }
  
  func unfollow() {
    guard let  currentUid =  Auth.auth().currentUser?.uid else { return }
    let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
    let followerRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
    
    followingRef.document(user.id).delete { _ in
      followerRef.document(currentUid).delete { _ in
        self.isFollowed = false
      }
    }
  }
  
  func checkIfUserIsFollowed() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
    
    followingRef.document(user.id).getDocument { snapshot, _ in
      guard let isFollowed = snapshot?.exists else { return }
      self.isFollowed = isFollowed
    }
    
  }
}
