import Foundation
import SwiftUI

struct event: Decodable, Hashable, Identifiable {
    var id: String
    var title: String
    var description: String
    var date: String
    var location: String
    var adresse: String
    var image: String
    
}
