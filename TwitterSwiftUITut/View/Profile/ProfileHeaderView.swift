//
//  ProfileHeaderView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 27/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct ProfileHeaderView: View {
  @ObservedObject var viewModel: ProfileViewModel
  
  var body: some View {
    VStack {
//      Image("batman")
      KFImage(URL(string: viewModel.user.profileImageUrl))
        .resizable()
        .scaledToFill()
        .clipped()
        .frame(width: 120, height: 120)
        .cornerRadius(120 / 2)
        .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
      
//      Text("Bruce Wayne")
      Text(viewModel.user.fullname)
        .font(.system(size: 16, weight: .semibold))
        .padding(.top, 8)
      
//      Text("@batman")
      Text("@\(viewModel.user.username)")
        .font(.subheadline)
        .foregroundColor(.gray)
      
      Text("Billionaire by day, dark knight by nignt")
        .font(.system(size: 14))
        .padding(.top, 8)
      
      HStack(spacing: 40) {
        VStack {
          Text("\(viewModel.user.stats.followers)")
            .font(.system(size: 16)).bold()
          
          Text("Followers")
            .font(.footnote)
            .foregroundColor(.gray)
        }
        
        VStack {
          Text("\(viewModel.user.stats.following)")
            .font(.system(size: 16)).bold()
          
          Text("Following")
            .font(.footnote)
            .foregroundColor(.gray)
        }
      }
      .padding()
      
      ProfileActionButtonView(viewModel: viewModel)
      
      Spacer()
    }
  }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//  static var previews: some View {
//    ProfileHeaderView()
//  }
//}
