//
//  TemperatureView.swift
//  Caelum
//

import SwiftUI

/// A SwiftUI view which displays the fetched current weather data. The data is derived from a api fetch request from www.weatherapi.com.
struct TemperatureView: View {
    var weatherData: Weather
    var body: some View {
        VStack{
            //Locale and Region / City and State
            Text("\(weatherData.location.name), \(weatherData.location.region)")
                .font(.title)
                .foregroundStyle(Color.white)
            
            //Current temperature
            Text("\(Int(weatherData.current.temp_f))°")
                .font(.largeTitle)
                .padding(15)
                .foregroundStyle(Color.white)
            
            //Conidition i.e, rainy, snowy, etc
            Text("\(weatherData.current.condition.text)")
                .font(.title2)
                .foregroundStyle(Color.white)
            
            //High and Low Temp
            HStack {
                //Low
                if let minTemp = weatherData.forecast.forecastday.first?.day.mintemp_f {
                    Text("L: \(Int(minTemp))°")
                }
                //High
                if let maxTemp = weatherData.forecast.forecastday.first?.day.maxtemp_f {
                    Text("L: \(Int(maxTemp))°")
                }
            }
            .foregroundStyle(Color.white)
            .font(.title2)
            .padding(.top, 15)
        }
    }
}
