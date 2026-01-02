//
//  ContentView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    @State var location = LocationGeocoded(name: "", lat: 0.0, lon: 0.0, state: "", country: "")
    @State var data = WeatherData(
        current: Current(
            temp: 0.0,
            weather: [Weather(description: "")]
        ),
        daily: [
            Daily(
                temp: TempRange(
                    min: 0.0,
                    max: 0.0
                )
            )
        ]
    )
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            HomeView(location: $location, data: $data, path: $path)
                .navigationDestination(for: String.self) { destination in
                        WeatherView(location: $location, data: $data)
                }
        }
    }
}

#Preview {
    ContentView()
}

