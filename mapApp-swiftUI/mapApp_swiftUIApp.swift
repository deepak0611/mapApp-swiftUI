//
//  mapApp_swiftUIApp.swift
//  mapApp-swiftUI
//
//  Created by Deepak Kumar1 on 15/12/24.
//

import SwiftUI

@main
struct mapApp_swiftUIApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
