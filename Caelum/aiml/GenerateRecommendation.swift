//
//  GenerateRecommendation.swift
//  Caelum
//
//

import FoundationModels
import Playgrounds
import SwiftUI

struct GenerateRecommendation: View {
    @Binding var data: WeatherData
    var session = LanguageModelSession(instructions: "In two very short sentences, suggest how to be best prepared given the provided weather data. Do not create lists.")
    @State var recommendation: String = ""
    
    func generateRecommendation() async {
        let description = data.current.weather.first?.description.capitalized ?? "Clear"
        let currentTemp = Int(round(data.current.temp))
        let lowTemp = Int(round(data.daily.first?.temp.min ?? 0))
        let highTemp = Int(round(data.daily.first?.temp.max ?? 0))

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
        .onChange(of: data) { oldValue, newValue in
            Task {
                await generateRecommendation()
            }
        }
    }
}

