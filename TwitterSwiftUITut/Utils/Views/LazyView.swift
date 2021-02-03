//
//  LazyView.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 03/02/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
  let build: () -> Content
  init(_ build: @autoclosure @escaping() -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}

