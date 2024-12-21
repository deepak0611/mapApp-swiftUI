//
//  Location.swift
//  mapApp-swiftUI
//
//  Created by Deepak Kumar1 on 15/12/24.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    //Identifiable -> to uniquely identify in a list
    let id = UUID().uuidString
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    //Equatable -> to know whether two instances of this are same or not, basically to tell on what basis it should be differentiated
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
