//
//  ConversationsView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 26/01/21.
//

import SwiftUI

struct ConversationsView: View {
  @State var isShowingNewMessageView = false
  @State var showChat = false
  @State var user: User?
  @ObservedObject var viewModel = ConversationsViewModel()
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      
      if let user = user {
        NavigationLink(destination: ChatView(user: user),
                       isActive: $showChat,
                       label: {} )
      }
      
      ScrollView {
        VStack {
          ForEach(viewModel.recentMessages) { message in
            NavigationLink(
              destination: ChatView(user: message.user),
              label: {
                ConversationCell(message: message)
              })
          }
        }.padding()
      }
      
      Button(action: {
              self.isShowingNewMessageView.toggle() },
             label: {
              Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding()
                .sheet(isPresented: $isShowingNewMessageView, content: {
                  NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user)
                })
             })
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .padding()
    }
  }
}

struct ConversationsView_Previews: PreviewProvider {
  static var previews: some View {
    ConversationsView()
  }
}
