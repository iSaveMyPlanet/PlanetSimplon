//
//  FavorisView.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 13/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import SwiftUI


struct FavorisView: View {
    @State private var selectorIndex = 0
    @State private var numbers = ["Articles","Evénements"]
    var body: some View {
        VStack {

            HStack{
                Picker("Numbers", selection: $selectorIndex) {
                    ForEach(0 ..< numbers.count) { index in
                        Text(self.numbers[index]).tag(index)
                    }
                }

            }
            .pickerStyle(SegmentedPickerStyle())


            if (selectorIndex == 0) {
                ActualityView()
            } else {
                EventView()
            }
            Spacer()

        }.navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

