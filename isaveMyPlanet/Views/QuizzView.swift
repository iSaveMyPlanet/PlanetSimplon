//
//  QuizzView.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 13/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import SwiftUI


struct QuizzView: View {
    var body: some View {
        VStack{
            
            
            VStack(alignment: .center){
                HStack {
                    
                    Text("iSaveMyPlanet")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(alignment: .center)
                    
                }
                
                HStack(alignment: .center) {
                    
                    Text("Quizz")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                }
                .padding(.leading, 250.0)
                
                Spacer()
            }
            .padding(.top, 200.0)
            HStack{
                Text("En Construction")
                    .foregroundColor(Color.white)
            }
            
            VStack{
                
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 40)
                        
                        .frame(width: 250.0, height: 50.0)
                    Text("Trouver un Joueur")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .foregroundColor(.green)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 175.0, height: 50.0)
                    Text("Classement")
                        .font(.title)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.green)
                
                Spacer()
            }
            
            
        }.background(Image("Quizza").resizable().frame(width: 500, alignment: .bottom)
            .aspectRatio(UIImage(named: "Quizza")!.size, contentMode: .fill)
            .clipped())
            .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
            
    }
}



struct QuizzView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzView()
    }
}
