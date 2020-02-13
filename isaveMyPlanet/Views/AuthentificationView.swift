//
//  ContentView.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 11/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var emailInscri: String = ""
    @State var passwordInscri: String = ""
    @State var pseudo: String = ""
    @State var loading = false
    @State var error = false
    @State var showDashboard = false
    @State var showDashboardinscri = false
    @State private var showAlert = false
    
    @ObservedObject var session: SessionStore = SessionStore()
    var alert: Alert {
        Alert(title: Text("iOScreator"), message: Text("Hello SwiftUI"), dismissButton: .default(Text("Dismiss")))
    }
    
    
    func createUser () {
        loading = true
        error = false
        session.createUser(email: email, password: password , pseudo :pseudo ) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            }
            else {
                self.email = ""
                self.password = ""
                self.showDashboard = true
                
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack () {
                /// Fields of connexion
                VStack{
                    
                    Text("Se connecter").font(.title).foregroundColor((Color(red: 107 / 255, green: 114 / 255, blue: 123 / 255)))
                    TextField("Saisir ton mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(30)
                    SecureField("Saisir ton mot de passe", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(30).frame( height: 30, alignment: .center)
                    
                    VStack {
                        NavigationLink(destination:  FilActualitesView() , isActive: $showDashboard ) {
                            Text("")
                        }.navigationBarBackButtonHidden(true)
                        Button(action: {
                            if self.email.isEmpty || self.password.isEmpty {
                                //self.isAlert = true
                                print("vide")
                            }
                            else {
                                self.session.logIn(email: self.email, password: self.password) { (result, error) in
                                    self.loading = false
                                    if error != nil {
                                        self.error = true
                                        self.showAlert = true
                                        Alert(title: Text("Second Alert"), message: Text("This is the second alert"))
                                        
                                    }
                                        
                                    else {
                                        self.email = ""
                                        self.password = ""
                                        self.showDashboard = true
                                        
                                    } } }
                        }) {
                            Text("Log in").padding(.all, CGFloat(25)).foregroundColor(.white).background((Color(red: 66 / 255, green: 74 / 255, blue: 93 / 255))).cornerRadius(CGFloat(20))
                        }
                    }
                }
                //Spacer().frame( height: CGFloat(50))
                
                
                /// Fields of inscription
                VStack{
                    
                    Text("S'inscrire").font(.title).foregroundColor((Color(red: 107 / 255, green: 114 / 255, blue: 123 / 255)))
                    TextField("Saisir ton mail", text: $emailInscri)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding(30).frame( height: 25, alignment: .center)
                    
                    SecureField("Saisir ton mot de passe", text: $passwordInscri)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(30).frame(alignment: .center).frame( height: 30, alignment: .center)
                    
                    TextField("Saisir ton pseudo", text: $pseudo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(30).frame( height: 30, alignment: .center)
                    VStack {
                        NavigationLink(destination:  FilActualitesView() , isActive: $showDashboardinscri ) {
                            Text("")
                        }.navigationBarBackButtonHidden(true)
                        Button(action: {
                            if self.emailInscri.isEmpty || self.passwordInscri.isEmpty {
                                //self.isAlert = true
                                print("vide")
                            }
                            else {
                                self.session.createUser(email: self.emailInscri, password: self.passwordInscri , pseudo : self.pseudo) { (result, error) in
                                    self.loading = false
                                    if error != nil {
                                        self.error = true
                                        self.showAlert = true
                                    }
                                    else {
                                        self.email = ""
                                        self.password = ""
                                        self.pseudo = ""
                                        self.showDashboardinscri = true
                                    } } }
                        }) {
                            Text("Sign in").padding(.all, CGFloat(25)).foregroundColor(.white).background((Color(red: 66 / 255, green: 74 / 255, blue: 93 / 255))).cornerRadius(CGFloat(20)).frame(width : 250,alignment: .center)
                        }
                        
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
