//
//  TweetDetailView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 01/02/21.
//

import SwiftUI
import KingfisherSwiftUI

struct TweetDetailView: View {
  let tweet: Tweet
  var body: some View {
    //        Text("Tweet Detail View")
    VStack(alignment: .leading, spacing: 16) {
      HStack {
//        Image("batman")
        KFImage(URL(string: tweet.profileImageUrl))
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 56, height: 56)
          .cornerRadius(28)
        
        VStack(alignment: .leading, spacing: 4) {
          Text(tweet.fullname)
            .font(.system(size: 14, weight: .semibold))
          
          Text("@\(tweet.username)")
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
      }
      
      Text(tweet.caption)
        .font(.system(size: 22))
      
      Text("7:22 PM • 05/01/2021")
        .font(.system(size: 14))
        .foregroundColor(.gray)
      
      Divider()
      
      HStack(spacing: 12) {
        HStack(spacing: 4) {
          Text("0")
            .font(.system(size: 14, weight: .semibold))
          
          Text("Retweets")
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
        
        HStack(spacing: 4) {
          Text("\(tweet.likes)")
            .font(.system(size: 14, weight: .semibold))
          
          Text("Likes")
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
      }
      
      Divider()
      
      TweetActionsView(tweet: tweet)
      
      Spacer()
    }.padding()
  }
}

//struct TweetDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    TweetDetailView()
//  }
//}
