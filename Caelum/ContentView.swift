//
//  ContentView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State var userInput: String = ""
    @State var weatherData: Weather = Weather(
        location: Location(name: "", region: "", country: ""),
        current: Current(
            temp_f: 0.0,
            condition: Condition(text: "")
        ),
        forecast: Forecast(
            forecastday: [
                Forecastday(
                    day: Day(
                        mintemp_f: 0.0,
                        maxtemp_f: 0.0
                    ),
                    hour: [
                        Hour(
                            time: "00:00",
                            temp_f: 0.0,
                            condition: Condition(text: "")
                        )
                    ]
                )
            ]
        )
    )
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            HomeView(userInput: $userInput, weatherData: $weatherData, path: $path)
                .navigationDestination(for: String.self) { destination in
                    WeatherView(userInput: $userInput, weatherData: $weatherData)
                        .navigationBarBackButtonHidden(true)
                        .toolbar{
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    $path.wrappedValue.removeLast()
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                }
        }
    }
}

#Preview {
    ContentView()
}
