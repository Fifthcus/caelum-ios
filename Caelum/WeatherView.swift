//
//  WeatherView.swift
//  Caelum
//

import SwiftUI

struct WeatherView: View {
    @Binding var city: String
    var temperature: Int = 35
    var weather: String = "Rainy"
    var temperature_low: Int = 30
    var temperature_high: Int = 40
    var degree_symbol: Bool = true
    var body: some View {
        VStack{
            
            Text("\(city)")
                .font(.title)
                .foregroundStyle(Color.white)
            
            VStack{
                
                //Current temperature
                Text("\(temperature)\(degree_symbol ? "°F" : "°C")")
                    .font(.largeTitle)
                    .padding(15)
                    .foregroundStyle(Color.white)
        
                Text("\(weather)")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                
                HStack {
                    
                    //Low
                    Text("L: \(temperature)\(degree_symbol ? "°F" : "°C")")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                    //High
                    Text("H: \(temperature)\(degree_symbol ? "°F" : "°C")")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                    
                }
                .padding(.top, 15)
            }
        }
    }
}
