//
//  HourlyForecastView.swift
//  Caelum
//

import SwiftUI

/// A SwiftUI view which renders the hourly forecast any given day. The data is derived from a api fetch request from www.weatherapi.com.
struct HourlyForecastView: View {
    var weatherData: Weather
    var hours: [Hour] { weatherData.forecast.forecastday.first?.hour ?? [] }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(hours, id: \.time) { hour in
                    VStack{
                        Text(hour.getHour(time: hour.time))
                            .foregroundStyle(Color.white)
                        Text(hour.condition.text)
                            .foregroundStyle(Color.white)
                        Text("\(Int(hour.temp_f))°")
                            .foregroundStyle(Color.white)
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}
