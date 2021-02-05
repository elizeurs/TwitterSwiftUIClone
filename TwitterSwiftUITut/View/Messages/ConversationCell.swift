//
//  ConversationCell.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 26/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct ConversationCell: View {
  let message: Message
  
  var body: some View {
    VStack {
      HStack(spacing: 12) {
//        Image("venom-10")
        KFImage(URL(string: message.user.profileImageUrl))
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 56, height: 56)
          .cornerRadius(28)
        
        VStack(alignment: .leading, spacing: 4) {
          Text(message.user.fullname)
            .font(.system(size: 14, weight: .semibold))
          
          Text(message.text)
            .font(.system(size: 15))
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(.black)
        .padding(.trailing)
      }
      
      Divider()
      
    }
  }
}

//struct ConversationCell_Previews: PreviewProvider {
//  static var previews: some View {
//    ConversationCell()
//  }
//}
