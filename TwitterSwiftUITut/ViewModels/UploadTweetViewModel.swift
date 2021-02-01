//
//  UploadTweetViewModel.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 01/02/21.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
  @Binding var isPresented: Bool
  
  init(isPresented: Binding<Bool>) {
    self._isPresented = isPresented
  }
  
  func uploadTweet(caption: String)  {
//    print("DEBUG: Upload tweet here..")
    guard let user = AuthViewModel.shared.user else { return }
    let docRef = COLLECTION_TWEETS.document()
    
    let data: [String: Any] = ["uid": user.id,
                               "caption": caption,
                               "fullname": user.fullname,
                               "username": user.username,
                               "profileImageUrl": user.profileImageUrl,
                               "likes": 0,
                               "id": docRef.documentID]
    
    docRef.setData(data) { _ in
      print("DEBUG: Successfully uploaded tweet..")
      self.isPresented = false
    }
  }
}
