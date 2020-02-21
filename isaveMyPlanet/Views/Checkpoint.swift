//
//  Checkpoint.swift
//  isaveMyPlanet
//
//  Created by TURPIN Christophe on 14/02/2020.
//  Copyright © 2020 randaTrimech . All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation
import MapKit

class Checkpoint: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  let subtitle: String?
    
  
    init(title: String?, coordinate: CLLocationCoordinate2D, subtitle: String?) {
    self.title = title
    self.coordinate = coordinate
    self.subtitle = subtitle
  }
}
