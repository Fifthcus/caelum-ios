//
//  WeatherView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

struct WeatherView: View {
    @Binding var userInput: String
    @Binding var weatherData: Weather
    @Binding var onDeviceLLMModel: SystemLanguageModel
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
                
                //Alerts view
                if !weatherData.alerts.alert.isEmpty {
                    CaelumSection(icon: "exclamationmark.circle", headerText: "Advisory"){
                        AlertsView(alerts: $weatherData.alerts)
                    }
                }
                
                //FoundationModels Recommender
                if case .available = onDeviceLLMModel.availability {
                    CaelumSection(icon: "sparkles.2", headerText: "AI Recommendation"){
                        GenerateRecommendation(weatherData: $weatherData)
                    }
                }

                //Hourly Forecst
                CaelumSection(icon: "clock", headerText: "Hourly Forecast"){
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

