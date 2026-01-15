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
                Text("L: \(Int(weatherData.forecast.forecastday.first!.day.mintemp_f))°")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                //High
                Text("H: \(Int(weatherData.forecast.forecastday.first!.day.maxtemp_f))°")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                
            }
            .padding(.top, 15)
        }
    }
}
