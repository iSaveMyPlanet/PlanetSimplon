import Foundation
import SwiftUI

struct publication: Decodable, Hashable, Identifiable {
    var id: String
    var title: String
    var content: String
    var likes: Int
    var date: String //date
    var image: String
}
