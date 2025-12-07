//
//  ToolbarView.swift
//  Caelum
//

import SwiftUI

struct ToolbarView: View {
    @State var inputText: String = ""
    @Binding var location: LocationGeocoded
    @Binding var data: WeatherData
    var body: some View {
        HStack {
            //Search Bar
            HStack{
                //Search Field
                TextField(
                    "Search for a city",
                    text: $inputText
                )
                .onSubmit {
                    let city = inputText
                    Task{
                        do{
                            //geocode url
                            let url_to_geocode_city: URL = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=1&appid=249850dec3739444cddb23b0dafe8ca0")!
                            //geocode api call
                            let (geocoded_location, _) = try await URLSession.shared.data(from: url_to_geocode_city)
                            let location_decoded = try JSONDecoder().decode([LocationGeocoded].self, from: geocoded_location)
                            
                            location = location_decoded.first!
                            
                            //weather api url
                            let url_to_fetch_weather: URL = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(location.lat)&lon=\(location.lon)&appid=249850dec3739444cddb23b0dafe8ca0&units=imperial")!
                            //weather api call
                            let (weather_data, _) = try await URLSession.shared.data(from: url_to_fetch_weather)
                            let weather_data_decoded = try JSONDecoder().decode(WeatherData.self, from: weather_data)
                            
                            data = weather_data_decoded
                            
                        } catch {
                            print("-+X+-")
                            print(error)
                            print("-+X+-")
                        }
                    }
                    
                    inputText = ""
                    
                }
                
                //Magnifying Glass
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(20)
            .glassEffect()
            
            //Camera
            HStack{
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            .padding(20)
            .glassEffect()
        }
    }
}
