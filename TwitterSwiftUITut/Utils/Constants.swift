//
//  Constants.swift
//  TwitterSwiftUITut
//
//  Created by Elizeu RS on 30/01/21.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")