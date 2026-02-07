//
//  WeatherView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

/// The SwiftUI view which is the senior most container view for all of the weather data. The data is derived from a api fetch request from www.weatherapi.com.
struct WeatherView: View {
    @Binding var userInput: String
    @State var weatherData: Weather = Weather()

    var body: some View {
        ScrollView(.vertical){
            VStack{
                //Temperature View
                TemperatureView(weatherData: weatherData)
                
                //Alerts view
                if !weatherData.alerts.alert.isEmpty {
                    CaelumSection(icon: "exclamationmark.circle", headerText: "Advisory"){
                        AlertsView(alerts: weatherData.alerts)
                    }
                }
                
                //FoundationModels Recommender
                CaelumSection(icon: "sparkles.2", headerText: "AI Recommendation"){
                    ModelAvailabilityView(weatherData: weatherData, modelAvailability: .showRecommender)
                }

                //Hourly Forecst
                CaelumSection(icon: "clock", headerText: "Hourly Forecast"){
                    HourlyForecastView(weatherData: weatherData)
                }
            }
            .padding()
        }
        .padding(.top, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        .task {
            let data = await fetchWeatherData(userInput: userInput)
            weatherData = data
        }
    }
}

