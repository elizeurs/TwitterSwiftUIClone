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
  @Published var userTweets =  [Tweet]()
  @Published var likedTweets = [Tweet]()
  
  init(user: User) {
    self.user = user
    checkIfUserIsFollowed()
    fetchUserTweets()
    fetchLikedTweets()
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
  
  func fetchUserTweets() {
    COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { Snapshot, _ in
      guard let documents = Snapshot?.documents else { return }
//      documents.forEach { document in
//        print("DEBUG: Doc data is \(document.data())")
      self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
      
      print("DEBUG: User tweets \(self.userTweets)")

    }
  }
  
  func fetchLikedTweets() {
    var tweets = [Tweet]()
    
    COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
      guard let documents = snapshot?.documents else { return }
      let tweetIDs = documents.map ({ $0.documentID })
      
      tweetIDs.forEach { id in
        COLLECTION_TWEETS.document(id).getDocument { snapshot, _ in
          guard let data = snapshot?.data() else { return }
          let tweet = Tweet(dictionary: data)
          tweets.append(tweet)
          guard tweets.count == tweetIDs.count else { return }
          
          self.likedTweets = tweets
  
//          print("DEBUG: Liked tweet is \(tweet)")
                    
        }
      }
    }
  }
  
  func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
    switch filter {
    case .tweets: return userTweets
    case .likes: return likedTweets
    }
  }
}
  
