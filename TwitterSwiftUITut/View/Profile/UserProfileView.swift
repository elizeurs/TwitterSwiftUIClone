//
//  UserProfileView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 27/01/21.
//

import SwiftUI

struct UserProfileView: View {
  @State var selectedFilter: TweetFilterOptions = .tweets
  let user: User
  @ObservedObject var viewModel: ProfileViewModel
  
  init(user: User) {
    self.user = user
    self.viewModel = ProfileViewModel(user: user)
  }
  
    var body: some View {
      ScrollView {
        VStack {
          ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
            .padding()
          
          FilterButtonView(selectedOption: $selectedFilter)
            .padding()
          
          ForEach(viewModel.likedTweets) { tweet in
            TweetCell(tweet: tweet)
              .padding()
          }
        }
        
        .navigationTitle("batman")
      }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
