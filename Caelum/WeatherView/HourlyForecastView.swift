//
//  HourlyForecastView.swift
//  Caelum
//

import SwiftUI

struct HourlyForecastView: View {
    @Binding var weatherData: Weather
    var body: some View {
        VStack{
            Section(header: ContainerHeader(header: .constant("Hourly Forecast"))){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(weatherData.forecast.forecastday.first!.hour){hour in
                            VStack{
                                Text(hour.getHour(time: hour.time))
                                    .foregroundStyle(Color.white)
                                Text(hour.condition.text)
                                    .foregroundStyle(Color.white)
                                Text("\(Int(hour.temp_f))")
                                    .foregroundStyle(Color.white)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .caelumContainerModifier()
    }
}

#Preview {
    @Previewable @State var weatherData = Weather(
        location: Location(name: "", region: "", country: ""),
        current: Current(
            temp_f: 0.0,
            condition: Condition(text: "")
        ),
        forecast: Forecast(
            forecastday: [
                Forecastday(
                    day: Day(
                        mintemp_f: 0.0,
                        maxtemp_f: 0.0
                    ),
                    hour: [
                        Hour(
                            time: "08:00",
                            temp_f: 30.0,
                            condition: Condition(text: "snowy")
                        ),
                        Hour(
                            time: "09:00",
                            temp_f: 20.0,
                            condition: Condition(text: "rainy")
                        )
                    ]
                )
            ]
        )
    )
    HourlyForecastView(weatherData: $weatherData)
}

