//
//  ActualityView.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 13/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation
import Firebase


struct ActualityView: View {
           @State private var searchQuery: String = ""
           @State var showingDetail = false
            let mycolor = (Color(red: 117 / 255, green: 183 / 255, blue: 130 / 255))
          
    var pubList: Array = [publication(id: "A0B0", title: "le WWF France détourne des petites annonces", content: "À l’occasion de la Saint-Valentin, le WWF France lance #LÉluDeMonCoeur, une campagne décalée pour mobiliser les citoyen·ne·s à un mois du premier tour des élections municipales, à la recherche de futur·e·s maires engagé·e·s pour la transition écologique !Trouver l’élu·e de son cœur : un vrai défi, dans la vie comme dans l'isoloir. Alors comment s’y prendre ? Si l’écologie est de plus en plus présente dans les programmes des candidat·e·s, comment se repérer et faire le tri entre les bonnes et mauvaises idées et des propositions plus ou moins ambitieuses ? Pas de stress, c’est là qu’entre en jeu le WWF ! ", likes: 0, date: "10/01/2020", image : "Panda", starselected: false),
                   publication(id: "A0B1", title: "La sixième extinction de masse des animaux s’accélère", content: "C’est ce qu’ils nomment « un anéantissement biologique ». Dans une étude très alarmante, publiée lundi 10 juillet dans les Proceedings of the National Academy of Sciences (PNAS), des chercheurs américains et mexicain concluent que les espèces de vertébrés reculent de manière massive sur Terre, à la fois en nombre d’animaux et en étendue. Une « défaunation » aux conséquences « catastrophiques » pour les écosystèmes et aux impacts écologiques, économiques et sociaux majeurs.Les trois auteurs, Gerardo Ceballos (Université nationale autonome du Mexique), Paul Ehrlich et Rodolfo Dirzo (Stanford) n’en sont pas à leur coup d’essai sur le thème de l’érosion de la biodiversité. En juin 2015, les deux premiers avaient déjà publié une autre étude dans la revue Science Advances, qui montrait que la faune de la Terre était d’ores et déjà en train de subir sa sixième extinction de masse. ", likes: 0, date: "13/02/2020", image: "Extinction", starselected: false)]

         var body: some View {
            VStack() {

                List {
                    
                    Section(header: SearchBar(text: self.$searchQuery)) {

                    ForEach(pubList.filter {
                        self.searchQuery.isEmpty ?
                            true :
                         "\($0.content)".contains(self.searchQuery.uppercased())
                               }, id: \.self ) { item in
                               
                                 VStack(alignment: .leading) {
                                 HStack {

                                    Image(item.image).resizable().frame(width: 80, height: 80, alignment: .leading)
                                    Text(item.title).bold()
                                        }
                                HStack {
                                   Button(action: {
                                   self.showingDetail.toggle()}){
                                       Text(item.content).lineLimit(3).padding(5).sheet(isPresented: self.$showingDetail) {
                                       DetailView(item:  item)}}
                                
                                }.padding(.bottom, 15)
                                    
                    }.padding(.top, 15)} }
                                  Spacer()
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            
                    }
            }
}

         
   
struct SearchBar : UIViewRepresentable {

    @Binding var text : String

    class Coordinator : NSObject, UISearchBarDelegate {

        @Binding var text : String

        init(text : Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            searchBar.showsCancelButton = true
         
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var starSelected = true
     var item : publication
    init( item: publication) {
        self.item = item

    }

    var body: some View {
     
                 
              
        VStack(){
            
            HStack {
            Spacer()
            Button("Fermer") {
              self.presentationMode.wrappedValue.dismiss()
            }.frame(width: 80, height: 80).padding(.trailing,20).foregroundColor(.green)
            }
            HStack {
                Image(item.image).resizable().frame(width: 150, height: 150, alignment: .leading).padding(.leading, 20)
                Text (item.title).font(.title)
                Spacer()

            }
            Text(item.content).padding(30)
            Spacer(minLength: 30)
            VStack {
            Button(action: {
                self.starSelected.toggle()}) {
                    if self.starSelected {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    } else {
                    Image(systemName: "star").foregroundColor(.green)
                    }
                }
            }.frame(alignment: .topLeading)
            Spacer()

            }
    }
}


