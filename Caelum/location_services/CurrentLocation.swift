//
//  FetchLocation.swift
//  Caelum
//

import SwiftUI
import CoreLocation

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
        .onChange(of: manager.coordinates){ oldValue, newValue in
            guard let newValue else { return }
            self.userInput = "\(newValue.latitude), \(newValue.longitude)"
            self.path.append("weather")
        }
    }
}

