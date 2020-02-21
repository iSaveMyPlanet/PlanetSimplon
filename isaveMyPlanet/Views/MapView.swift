import MapKit
import SwiftUI
import CoreLocation

struct MapView: UIViewRepresentable {
  @State var showMapEvent = false
  var locationManager = CLLocationManager()
    @State var currentItem  = event(creator: "", id: "", title: "", description: "", date: "", location: "", adresse: "", latitude: 0.0, longitude: 0.0, image: "", map: "")
  @State private var checkpoints = [
    Checkpoint(title: "Sauver les Pandas", coordinate: CLLocationCoordinate2D(latitude: 43.276295, longitude:5.393036), subtitle: "Il faut sauver les pandas ! Alors je vous explique ... On a décidé de creer un événement pour sauver les pandas, du moins essayer ! L'objectif de cet événement, c'est de marcher dans la rue avec des bambous dans les mains et de scander: \"Des pandas contre les bambous, sans eux on y viendra plus à bout.\" Puis on fera circuler un chapeau et tout l'argent recolté ira à des associations pour sauver les pandas"),
    Checkpoint(title: "Nettoie ta mer", coordinate: CLLocationCoordinate2D(latitude: 43.264397, longitude: 5.370369), subtitle: "Ce n'est pas pour être impoli, mais ta mer est sâle. A la base super jolie, elle est ce qu'elle avale. alors appelles tous tes amis pour ce nettoyage colossale!!"),
      Checkpoint(title: "Ste Marguerite au vert", coordinate: CLLocationCoordinate2D(latitude: 43.272062, longitude: 5.407931), subtitle: "une course au déchets permettant au groupe ayant ramassé le plus de déchets de gagner un vélo electrique"),
      Checkpoint(title: "Conférence Baille", coordinate: CLLocationCoordinate2D(latitude: 43.288187, longitude: 5.399285), subtitle: "Conférence sur l'implication de la mairie dans une politique écoreponsable")
    ]
    
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.addAnnotations(checkpoints)
    }
    
}
