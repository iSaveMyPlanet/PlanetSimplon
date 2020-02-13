//
//  ActualityView.swift
//  isaveMyPlanet
//
//  Created by randaTrimech  on 13/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import SwiftUI

struct ActualityView: View {
           @State private var searchQuery: String = ""

    var pubList = [publication(id: "A0B0", title: "pandaGo", content: "I want to save pandas using a new game call pandaGo. In this game you'll \"catch\" Pandas and food them and it will unable real pandas to get heal and food", likes: 0, date: "10-janvier", image :  "person.crop.circle"),
                        publication(id: "A0B1", title: "ELEPHANT", content: "oidugiuadha piuhdaiuh diuh zdpiuh piaud pigdg iogdh lgdgdpihpuh dih pudpi hdhpiuh dilhlkjdhlkhd iuh igdlhgldjhuilh pdahp iudhg iluhdh l oidugogd lglbqdzkhj kjhdb og oiqbjhqg lq ldhgdqlggzilgljhgdkjgh olg dg hdj khjgqz kdq", likes: 2, date: "13-janvier", image: "person.crop.circle") ]
         var body: some View {
             VStack() {
                List {
                    Section(header: SearchBar(text: self.$searchQuery)) {
                               ForEach(pubList.filter {
                                   self.searchQuery.isEmpty ?
                                       true :
                                       "\($0)".contains(self.searchQuery)
                               }, id: \.self) { item in
                                VStack(alignment: .leading) {
                                 HStack {
                                 Image(systemName: item.image).font(.title)
                                 Text(item.title).font(.title)
                                        }
                                HStack {
                                   Text(item.content).lineLimit(3).padding(5).border(Color.gray)
                                    Button(action: {
                                    }){
                                        Image(systemName: "star")
                                    }
                                    }
                                    Button(action: {
                                            }){
                                           Text("J'aime")
                                             }
                                             }.padding(.leading, 20)
                        }} }
                                  Spacer()
            }.navigationBarTitle("", displayMode: .inline)
                         .navigationBarHidden(true)
            
    }
                       }
//                 ForEach (pubList) { pub in
//                     VStack(alignment: .leading) {
//                         HStack {
//                             Image(systemName: pub.image).font(.title)
//                             Text(pub.title).font(.title)
//                         }
//                         HStack {
//                            Text(pub.content).lineLimit(3).padding(5).border(Color.gray).cornerRadius(15)
//                             Button(action: {
//                             }){
//                                 Image(systemName: "star")
//                             }
//                         }
//                     //.foregroundColor(.gray).font(.footnote)
//                         Button(action: {
//                         }){
//                             Text("J'aime")
//                         }
//                     }.padding(.leading, 20)
//                    Spacer()
//                 }
//             }.navigationBarTitle("", displayMode: .inline)
//                 .navigationBarHidden(true)
         
   
struct SearchBar: UIViewRepresentable {

    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}



