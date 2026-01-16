//
//  WeatherView.swift
//  Caelum
//

import SwiftUI

struct WeatherView: View {
    @Binding var userInput: String
    @Binding var weatherData: Weather
    var degree_symbol: Bool = true
    let key = Secrets.apiKey
    
    func fetchWeather() async {
        do{
            if key != "" {
                let url: URL = URL(string:"https://api.weatherapi.com/v1/forecast.json?key=\(key)&q=\(userInput)&days=1&aqi=no&alerts=yes")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoded = try JSONDecoder().decode(Weather.self, from: data)
                
                weatherData = decoded
            }
        } catch {
            print(error)
        }
    }
    var body: some View {
        ScrollView(.vertical){
            VStack{
                //Temperature View
                TemperatureView(weatherData: $weatherData)
                
                //FoundationModels Recommender
                GenerateRecommendation(weatherData: $weatherData)
                    .frame(width: .infinity)
                    .padding(.vertical)

                //Hourly Forecst
                CaelumSection(headerText: "Hourly Forecast"){
                    HourlyForecastView(weatherData: $weatherData)
                }
            }
            .padding()
        }
        .padding(.top, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        .task {
            await fetchWeather()
        }
    }
}

