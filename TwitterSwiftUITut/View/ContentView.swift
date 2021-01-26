//
//  ContentView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 25/01/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
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
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
