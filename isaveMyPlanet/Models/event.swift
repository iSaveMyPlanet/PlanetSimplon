import Foundation
import SwiftUI
import CoreLocation

struct event: Decodable, Hashable, Identifiable {
    var creator: String
    var id: String
    var title: String
    var description: String
    var date: String
    var location: String
    var adresse: String
    var latitude: CLLocationDegrees.Magnitude
    var longitude: CLLocationDegrees.Magnitude
    var image: String
    var map: String
}
