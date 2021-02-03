//
//  SearchView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 26/01/21.
//

import SwiftUI

struct SearchView: View {
  @State var searchText = ""
  @ObservedObject var viewModel = SearchViewModel()
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText)
        .padding()
      
      VStack(alignment: .leading) {
        ForEach(viewModel.users) { user in
          HStack { Spacer() }
          
          NavigationLink(
            destination: LazyView(UserProfileView(user: user)),
            label: {
              UserCell(user: user)
            })
        }
      }.padding(.leading)
    }
  }
}

//struct SearchView_Previews: PreviewProvider {
//  static var previews: some View {
//    SearchView()
//  }
//}
