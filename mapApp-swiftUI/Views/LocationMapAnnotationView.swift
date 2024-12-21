//
//  LocationMapAnnotationView.swift
//  mapApp-swiftUI
//
//  Created by Deepak Kumar1 on 21/12/24.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundColor(.accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40) // extra padding in the bottom to keep the image center at the trianle tip
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
