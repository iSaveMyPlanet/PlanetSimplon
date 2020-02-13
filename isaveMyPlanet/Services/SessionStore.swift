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

class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    
    var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    var ref: DatabaseReference = Database.database().reference()

    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.session = User(
                    id: user.uid,
                    name: user.displayName!
                )
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }

    
    func createUser(
        email: String,
        password: String,
        pseudo : String ,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        //self.ref.child("users/\(user.uid)/pseudo").setValue(pseudo)

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
            self.session = nil
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
