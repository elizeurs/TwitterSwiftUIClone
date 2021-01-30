//
//  TwitterSwiftUITutApp.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 25/01/21.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUITutApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(AuthViewModel())
        }
    }
}
