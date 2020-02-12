import Foundation
import SwiftUI

struct Repository: Decodable, Hashable, Identifiable {
    var id: String
    var title: String
    var description: String
    var date: date
    var location: String
    var adresse: String
    var image: String
    
}
