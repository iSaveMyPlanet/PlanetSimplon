import Foundation
import SwiftUI

struct User: Decodable, Hashable, Identifiable {
    var id: String
    var name: String
    var mail: String?
    var password: String?
}
