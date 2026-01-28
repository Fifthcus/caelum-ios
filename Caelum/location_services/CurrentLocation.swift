//
//  FetchLocation.swift
//  Caelum
//

import SwiftUI
import CoreLocation

struct CurrentLocation: View {
    @StateObject private var manager = LocationManager()
    @Binding var weatherData: Weather
    @Binding var userInput: String
    @Binding var path: NavigationPath
    var body: some View {
        Button(action: {
            manager.requestLocation()
            
            if let coordinates = manager.coordinates {
                userInput = "\(coordinates.latitude), \(coordinates.longitude)"
                path.append("weather")
            }
        }){
            HStack{
                Image(systemName: "location.fill")
                Text("Current Location")
            }
            .foregroundStyle(Color.white)
            
        }
    }
}
