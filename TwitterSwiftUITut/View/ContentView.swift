//
//  ContentView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 25/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    Group {
      if viewModel.userSession != nil {
        NavigationView {
          
          TabView {
    //        Text("Feed")
            FeedView()
              .tabItem {
                Image(systemName: "house")
                Text("Home")
              }
            
    //        Text("Search View")
              SearchView()
              .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
              }
            
    //        Text("Message")
              ConversationsView()
              .tabItem {
                Image(systemName: "envelope")
                Text("Messages")
              }
          }
          .navigationBarTitle("Home")
          .navigationBarItems(leading: Button(action: {
            viewModel.signOut()
          }, label: {
            if let user = viewModel.user {
              KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 32, height: 32)
                .cornerRadius(16)
            }
          }))
          .navigationBarTitleDisplayMode(.inline)
        }
      } else {
        LoginView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
