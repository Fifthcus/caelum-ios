//
//  FetchLocation.swift
//  Caelum
//

import SwiftUI
import CoreLocation

struct Coords: Equatable {
    var latitude: Double
    var longitude: Double
}

struct CurrentLocation: View {
    @StateObject private var manager = LocationManager()
    @Binding var userInput: String
    @Binding var path: NavigationPath
    var body: some View {
        Button(action: {
            manager.requestLocation()
        }){
            HStack{
                Image(systemName: "location.fill")
                Text("Current Location")
            }
            .foregroundStyle(Color.white)
        }
        .onChange(of: manager.coordinates.map { coords in
            Coords(latitude: coords.latitude, longitude: coords.longitude)
        }) { oldValue, newValue in
            if let coords = newValue {
                userInput = "\(coords.latitude), \(coords.longitude)"
                path.append("weather")
            } else {
                userInput = ""
            }
        }
    }
}
