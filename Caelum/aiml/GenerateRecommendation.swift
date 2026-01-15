//
//  GenerateRecommendation.swift
//  Caelum
//
//

import FoundationModels
import Playgrounds
import SwiftUI

struct GenerateRecommendation: View {
    @Binding var weatherData: Weather
    var session = LanguageModelSession(instructions: "In two very short sentences, suggest how to be best prepared given the provided weather data. Do not create lists.")
    @State var recommendation: String = ""
    
    func generateRecommendation() async {
        let description = weatherData.current.condition.text
        let currentTemp = weatherData.current.temp_f
        let lowTemp = weatherData.forecast.forecastday[0].day.mintemp_f
        let highTemp = weatherData.forecast.forecastday[0].day.maxtemp_f

        let prompt = """
        The weather is \(description).
        The current temperature is \(currentTemp) degrees Fahrenheit.
        The day's low will be \(lowTemp) degrees Fahrenheit.
        The day's high will be \(highTemp) degrees Fahrenheit.
        In two very short sentences, suggest how the user may best prepare themselves given this weather.
        """
        
        do {
            let response = try await session.respond(to: prompt)
            recommendation = response.content
        } catch {
            recommendation = ""
        }
    }
    var body: some View {
        Group {
            Text(recommendation)
                .font(.footnote)
        }
        .foregroundStyle(Color.white)
        .caelumContainerModifier()
        .onChange(of: weatherData) { oldValue, newValue in
            Task {
                await generateRecommendation()
            }
        }
    }
}
