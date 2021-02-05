//
//  MessageView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 27/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct MessageView: View {
  let message: Message
  
  var body: some View {
    HStack {
      if message.isFromCurrentUser {
        Spacer()
        Text(message.text)
          .padding()
          .background(Color.blue)
          .clipShape(ChatBubble(isFromCurrentUser: true))
          .foregroundColor(.white)
          .padding(.horizontal)
      } else {
        HStack(alignment: .bottom) {
          KFImage(URL(string: message.user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          
          Text(message.text)
            .padding()
            .background(Color(.systemGray5))
            .clipShape(ChatBubble(isFromCurrentUser: false))
            .foregroundColor(.black)
        }.padding(.horizontal)
        Spacer()
      }
    }
  }
}


//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//      MessageView(message: MOCK_MESSAGES[0])
//    }
//}
