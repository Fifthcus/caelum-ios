//
//  HourlyForecastView.swift
//  Caelum
//

import SwiftUI

struct HourlyForecastView: View {
    @Binding var weatherData: Weather
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
