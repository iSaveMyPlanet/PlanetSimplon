//
//  FilActualitesView.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 12/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
     // Text("on test")
       Tabs()
}
}
struct Tabs: View {

    @State private var selected = 0

    var body: some View {
        TabView(selection: $selected) {
            
            FilActualiteesView().tabItem {
                Image(systemName: (selected == 1 ? "book" : "book"))
            }.tag(0)
            MapView()
                .tabItem {
                    Image(systemName: (selected == 1 ? "location" : "location"))
                }.tag(1)
            FavorisView()
            .tabItem {
                 Image(systemName: (selected == 1 ? "star.fill" : "star.fill"))
            }.tag(2)
            QuizzView()
            .tabItem {
               Image(systemName: (selected == 1 ? "gamecontroller" : "gamecontroller"))
            }.tag(3)
            
            ProfilView()
            .tabItem {
                Image(systemName: (selected == 1 ? "person" : "person"))
            }.tag(4)
            
          
        }
    }
}
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
