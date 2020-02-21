import Foundation
import SwiftUI
import CoreLocation

struct ListEventView: View {
@State private var searchQuery: String = ""
@State var showingDetail = false
    @State var currentItem  = event(creator: "", id: "", title: "", description: "", date: "", location: "",adresse : "", latitude: 0.0, longitude: 0.0, image: "", map: "")

    var eventList = [event(creator: "xxxxxx", id: "C0D0", title: "Sauver les Pandas", description: "Il faut sauver les pandas ! Alors je vous explique ... On a décidé de creer un événement pour sauver les pandas, du moins essayer ! L'objectif de cet événement, c'est de marcher dans la rue avec des bambous dans les mains et de scander: \"Des pandas contre les bambous, sans eux on y viendra plus à bout.\" Puis on fera circuler un chapeau et tout l'argent recolté ira à des associations pour sauver les pandas",date: "10 mars",location:"Marseille",adresse:"29 Boulevard de Louvain", latitude: 43.276295, longitude:5.393036, image: "Panda", map: "MapLouvain"), event(creator: "ABCD", id: "C0D1", title: "Nettoie ta mer", description: "Ce n'est pas pour être impoli, mais ta mer est sâle. A la base super jolie, elle est ce qu'elle avale. alors appelles tous tes amis pour ce nettoyage colossale!!", date: "20 mars", location: "Marseille", adresse: "plage du Prado Nord", latitude: 43.264397, longitude: 5.370369, image: "imageMer", map: "MapPrado"), event(creator: "EFGH", id: "C0D2", title: "Ste Marguerite au vert", description: "une course au déchets permettant au groupe ayant ramassé le plus de déchets de gagner un vélo electrique", date: "25 mars", location: "Marseille", adresse: "avenue des Trinitaines", latitude: 43.272062, longitude: 5.407931, image: "imageCourse", map: "MapMarguerite"), event(creator: "IJKL", id: "C0D3", title: "Conférence Baille", description: "Conférence sur l'implication de la mairie dans une politique écoreponsable avec l'association IsaveMyPlanet", date: "28 mars", location: "Marseille", adresse: "Boulevard Baille", latitude: 43.288187, longitude: 5.399285, image: "imagePlanet", map: "MapBaille")]
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





