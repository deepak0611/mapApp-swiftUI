//
//  LocationsViewModel.swift
//  mapApp-swiftUI
//
//  Created by Deepak Kumar1 on 15/12/24.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // current location on the map
    @Published var mapLocation: Location {
        didSet {
            self.updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on the map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of locations
    @Published var showLocationsList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            return
        }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
