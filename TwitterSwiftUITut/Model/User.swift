//
//  User.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 30/01/21.
//

import Firebase

struct User: Identifiable {
  let id: String
  let username: String
  let profileImageUrl: String
  let fullname: String
  let email: String
  var stats: UserStats
  
  var isFollowed = false
  var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }  
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["uid"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
    self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.stats = UserStats(followers: 0, following: 0)
  }
}

struct UserStats {
  let followers: Int
  let following: Int
}
