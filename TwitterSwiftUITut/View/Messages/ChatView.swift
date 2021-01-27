//
//  ChatView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 27/01/21.
//

import SwiftUI

struct ChatView: View {
  @State var messageText: String = ""
  
    var body: some View {
      VStack {
        ScrollView {
          VStack(alignment: .leading, spacing: 12) {
            ForEach(0..<15) { _ in
              HStack {
                Spacer()
                Text("Text message test")
                  .padding()
                  .background(Color.blue)
                  .clipShape(ChatBubble(isFromCurrentUser: false))
                  .foregroundColor(.white)
                  .padding(.horizontal)
              }
            }
          }
        }
        
        MessageInputView(messageText: $messageText)
          .padding()
        
      }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
