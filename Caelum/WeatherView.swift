//
//  WeatherView.swift
//  Caelum
//

import SwiftUI

struct WeatherView: View {
    @Binding var location: LocationGeocoded
    @Binding var data: WeatherData
    var degree_symbol: Bool = true
    var body: some View {
        VStack{
            
            if location.country == "US" {
                Text("\(location.name), \(location.state!)")
                    .font(.title)
                    .foregroundStyle(Color.white)
            } else {
                Text("\(location.name)")
                    .font(.title)
                    .foregroundStyle(Color.white)
            }
            
            VStack{
                
                //Current temperature
                Text("\(data.current.temp)\(degree_symbol ? "°F" : "°C")")
                    .font(.largeTitle)
                    .padding(15)
                    .foregroundStyle(Color.white)
        
                Text("\(data.current.weather[0].description)")
                    .font(.title2)
                    .foregroundStyle(Color.white)
                
                HStack {
                    
                    //Low
                    Text("L: \(data.daily.first!.temp.min)\(degree_symbol ? "°F" : "°C")")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                    //High
                    Text("H: \(data.daily.first!.temp.max)\(degree_symbol ? "°F" : "°C")")
                        .font(.title3)
                        .foregroundStyle(Color.white)
                    
                }
                .padding(.top, 15)
            }
        }
    }
}
