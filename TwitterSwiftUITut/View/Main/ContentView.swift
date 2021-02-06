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
  @State private var selectedIndex = 0
  
  var body: some View {
    Group {
      if viewModel.userSession != nil {
        NavigationView {
          
          //          TabView {
          //    //        Text("Feed")
          //            FeedView()
          //              .tabItem {
          //                Image(systemName: "house")
          //                Text("Home")
          //              }
          //
          //    //        Text("Search View")
          //              SearchView()
          //              .tabItem {
          //                Image(systemName: "magnifyingglass")
          //                Text("Search")
          //              }
          //
          //    //        Text("Message")
          //              ConversationsView()
          //              .tabItem {
          //                Image(systemName: "envelope")
          //                Text("Messages")
          //              }
          //          }
          //          .navigationBarTitle("Home")
          
          MainTabView(selectedIndex: $selectedIndex)
//            .cornerRadius(showingMenu ? 20 : 10)
//            .ignoresSafeArea()
            .navigationBarTitle(viewModel.tabTitle(forIndex: selectedIndex))
            .navigationBarTitleDisplayMode(.inline)
//            .offset(x: showingMenu ? 300 : 0, y: showingMenu ? 44 : 0)
//            .opacity(showingMenu ? 0.25 : 1)
//            .scaleEffect(showingMenu ? 0.9 : 1)
//            .shadow(color: self.showingMenu ? .black : .clear, radius: 20, x: 0, y: 0)
//            .disabled(showingMenu)
            
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
