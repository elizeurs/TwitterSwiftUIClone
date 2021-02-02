//
//  TweetCell.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 26/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct TweetCell: View {
  let tweet: Tweet
  
    var body: some View {
      VStack(alignment: .leading) {
        HStack(alignment: .top, spacing: 12) {
//          Image("batman")
          KFImage(URL(string: tweet.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 56, height: 56)
            .cornerRadius(56 / 2)
            .padding(.leading)
          
          VStack(alignment: .leading, spacing: 4) {
            HStack {
//              Text("Bruce Wayne")
              Text(tweet.fullname)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
              
//              Text("@batman •")
                Text("@\(tweet.username)")
                .foregroundColor(.gray)
              
              Text("2w")
                .foregroundColor(.gray)
            }
            
//            Text("It's not who i am underneath, but what i do that defines me")
            Text(tweet.caption)
              .foregroundColor(.black)

          }
        }
        .padding(.bottom)
        .padding(.trailing)
        
        TweetActionsView(tweet: tweet)
        
        Divider()
      }
//      .padding(.leading, -16)
    }
}

//struct TweetCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCell()
//    }
//}
