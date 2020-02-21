import Foundation
import SwiftUI
import CoreLocation

struct EventView: View {
@State private var searchQuery: String = ""
@State var showingDetail = false
    @State var currentItem  = event(creator: "", id: "", title: "", description: "", date: "", location: "",adresse : "", latitude: 0.0, longitude: 0.0, image: "", map: "")

    var eventList = [event(creator: "xxxxxx", id: "C0D0", title: "Sauver les Pandas", description: "Ils faut sauver les pandas ! Alors je vous explique ... On a décidé de creer un événement pour sauver les pandas, du moins essayer ! L'objectif de cet événement, c'est de marcher dans la rue avec des bambous dans les mains et de scander: \"Des pandas contre les bambous, sans eux on y viendra plus à bout.\" Puis on fera circuler un chapeau et tout l'argent recolté ira à des associations pour sauver les pandas",date: "10 janvier",location:"Marseille",adresse:"53 rue fauchier", latitude :43.303583, longitude:5.368744, image: "Panda", map: "Mapp")]
var body: some View {
    VStack() {
        List {
            Section(header: SearchBar(text: self.$searchQuery)) {

            ForEach(eventList.filter {
                self.searchQuery.isEmpty ?
                    true :
                 "\($0.description)".contains(self.searchQuery.uppercased())
                }, id: \.self ) { item in
                    
                    VStack(alignment: .leading) {
                        HStack {
                            
                            Image(item.image)
                                .resizable()
                                
                                .frame(width: 100.0, height: 100.0)
                            
                            
                            Text(item.title).font(.title)
                        }
                        HStack {
                            Text(item.description).lineLimit(3).padding(5)
                            
                        }
                        Button(action: {
                            self.showingDetail.toggle()}){
                                Text("").foregroundColor(.green).font(Font.system(size: 12)).underline()
                        }.padding(.leading, 250).sheet(isPresented: self.$showingDetail) {
                            DetailEventView(item:  item)}
                        
                    }} }
            Spacer()
            
        }.navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        
    }
}
}

struct DetailEventView: View {
  @Environment(\.presentationMode) var presentationMode
  @State var starSelected = true
  @State var showModif = false
     var item : event
    init( item: event) {
        self.item = item
    }
    var body: some View {
        NavigationView {
            VStack(){
                HStack {
                  Spacer()
                Button("Fermer") {
                    self.presentationMode.wrappedValue.dismiss()
                }.frame(width: 80, height: 80).padding(.trailing,20).foregroundColor(.green)
                    }
            Text (item.title).font(.largeTitle)
            HStack {
                Image(item.image)
                    
                    .resizable()
                    .frame(width : 100, height: 100)
                Image(systemName: "mappin.circle.fill").padding(10).font(.title).foregroundColor(.red)
                VStack(alignment: .leading) {
                    Text("Le \(item.date)").multilineTextAlignment(.leading).frame(alignment: .leading)
                    Text("Au \(item.adresse)").frame(alignment: .leading)
                    Text("A \(item.location)").frame(alignment: .leading)
                }.padding(.top)
                }
        
            Text(item.description).padding(10)
            
    
            VStack{
                Button(action: {
                self.starSelected.toggle()}) {
                    if self.starSelected {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    } else {
                    Image(systemName: "star").foregroundColor(.green)
                    }
                }
                Spacer()
                Image(item.map)
                    
                    .resizable()
                    .frame(width:300, height: 200)
                
            }.padding(.top) .padding(.bottom, 50)               }.navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}
}



