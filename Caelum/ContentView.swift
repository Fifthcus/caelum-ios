//
//  ContentView.swift
//  Caelum
//

import SwiftUI


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
    var body: some View {
        VStack{
            //Title
            if location.name.isEmpty {
                Text("Caelum")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            } else {
                WeatherView(location: $location, data: $data)
                    .padding(75)
                Spacer()
            }
            ToolbarView(location: $location, data: $data)
        }
        .padding(15)
        .caelumBackgroundModifier()
    }
}

#Preview {
    ContentView()
}
