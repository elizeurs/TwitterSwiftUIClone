//
//  UserCell.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 26/01/21.
//

import SwiftUI
import KingfisherSwiftUI

struct UserCell: View {
  let user: User
  
    var body: some View {
      HStack(spacing: 12) {
//        Image("venom-10")
        KFImage(URL(string: user.profileImageUrl))
          .resizable()
          .scaledToFill()
          .clipped()
          .frame(width: 56, height: 56)
          .cornerRadius(28)
        
        VStack(alignment: .leading, spacing: 4) {
//          Text("venom")
          Text(user.username)
            .font(.system(size: 14, weight: .semibold))
          
//          Text("Eddie Brock")
          Text(user.fullname)
            .font(.system(size: 14))
        }
        .foregroundColor(.black)
      }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
