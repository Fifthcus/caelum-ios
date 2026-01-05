//
//  WeatherView.swift
//  Caelum
//

import SwiftUI

struct WeatherView: View {
    @Binding var location: LocationGeocoded
    @Binding var data: WeatherData
    var degree_symbol: Bool = true
    let key = Secrets.apiKey
    
    func fetchWeather() async {
        do{
            if key != "" {
                //geocode url
                let url_to_geocode_city: URL = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(location.name)&limit=1&appid=\(key)")!
                //geocode api call
                let (geocoded_location, _) = try await URLSession.shared.data(from: url_to_geocode_city)
                let location_decoded = try JSONDecoder().decode([LocationGeocoded].self, from: geocoded_location)
                print("Location Decoded: \(location_decoded)")
                
                location = location_decoded.first!
                
                //weather api url
                let url_to_fetch_weather: URL = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(location.lat)&lon=\(location.lon)&appid=\(key)&units=imperial")!
                //weather api call
                let (weather_data, _) = try await URLSession.shared.data(from: url_to_fetch_weather)
                let weather_data_decoded = try JSONDecoder().decode(WeatherData.self, from: weather_data)
                
                data = weather_data_decoded
                print(location)
                print(data)
            }
        } catch {
            print(error)
            print(error)
        }
    }
    var body: some View {
        VStack{
            
            Text("\(location.name), \(location.state!)")
                .font(.title)
                .foregroundStyle(Color.white)
            
            VStack{
                
                //Current temperature
                Text("\(Int(data.current.temp))\(degree_symbol ? "°F" : "°C")")
                    .font(.largeTitle)
                    .padding(15)
                    .foregroundStyle(Color.white)
        
                Text("\(data.current.weather[0].description)")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                
                HStack {
                    
                    //Low
                    Text("L: \(Int(data.daily.first!.temp.min))\(degree_symbol ? "°F" : "°C")")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                    //High
                    Text("H: \(Int(data.daily.first!.temp.max))\(degree_symbol ? "°F" : "°C")")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                    
                }
                .padding(.top, 15)
                
                //FoundationModels Recommender
                GenerateRecommendation(data: $data)
                
            }
        }
        .padding(.top, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        .task {
            await fetchWeather()
        }
    }
}
