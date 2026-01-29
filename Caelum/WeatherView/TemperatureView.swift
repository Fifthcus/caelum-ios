//
//  TemperatureView.swift
//  Caelum
//

import SwiftUI

struct TemperatureView: View {
    @Binding var weatherData: Weather
    var body: some View {
        VStack{
            Text("\(weatherData.location.name), \(weatherData.location.region)")
                .font(.title)
                .foregroundStyle(Color.white)
            
            //Current temperature
            Text("\(Int(weatherData.current.temp_f))°")
                .font(.largeTitle)
                .padding(15)
                .foregroundStyle(Color.white)
            
            Text("\(weatherData.current.condition.text)")
                .font(.title2)
                .foregroundStyle(Color.white)
            
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
