//
//  SessionStore.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 12/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//


import SwiftUI
import Firebase
import Combine

class SessionStore  {
    
    var handle: AuthStateDidChangeListenerHandle?
    var ref: DatabaseReference = Database.database().reference()

    

    
    func createUser(
        email: String,
        password: String,
        pseudo : String ,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
}

    func logIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            return false
        }
    }
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
}
