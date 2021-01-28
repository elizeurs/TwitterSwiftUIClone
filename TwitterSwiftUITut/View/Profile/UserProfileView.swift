//
//  UserProfileView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 27/01/21.
//

import SwiftUI

struct UserProfileView: View {
  @State var selectedFilter: TweetFilterOptions = .tweets
  
    var body: some View {
      ScrollView {
        VStack {
          ProfileHeaderView()
            .padding()
          
          FilterButtonView(selectedOption: $selectedFilter)
            .padding()
          
          ForEach(0..<9) { tweet in
            TweetCell()
              .padding()
          }
        }
        
        .navigationTitle("batman")
      }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
