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
              
//              Text("@batman •")
                Text("@\(tweet.username)")
                .foregroundColor(.gray)
              
              Text("2w")
                .foregroundColor(.gray)
            }
            
//            Text("It's not who i am underneath, but what i do that defines me")
            Text(tweet.caption)
          }
        }
        .padding(.bottom)
        .padding(.trailing)
        
        HStack {
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "bubble.left")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
          
          Spacer()
          
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "arrow.2.squarepath")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
          
          Spacer()
          
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "heart")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
          
          Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Image(systemName: "bookmark")
                .font(.system(size: 16))
                .frame(width: 32, height: 32)
          })
        }
        .foregroundColor(.gray)
        .padding(.horizontal)
        
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
