//
//  WeatherPrepRecommender.swift
//  Caelum
//

import FoundationModels
import Playgrounds
import SwiftUI

@Generable
struct Recommendation {
    let text: String
}

/// A SwiftUI view that uses the on-device LLM, to generate and render weather preparation recommendations.
struct WeatherPrepRecommender: View {
    var weatherData: Weather
    static let instructions: String = "In two short sentences, suggest how to safely prepare for the weather based on the provided data. Ensure your responses are one sentence after another, no lists, and do not format your response where the second sentence appears on a new line."
    var session = LanguageModelSession(instructions: instructions)
    @State var recommendation: Recommendation.PartiallyGenerated?
    
    //Recommendation Generator
    func generateRecommendation() async {
        let prompt = "\(weatherData)"
        let responseToStreamToUI = session.streamResponse(to: prompt, generating: Recommendation.self)
        
        do {
            for try await partial in responseToStreamToUI {
                recommendation = partial.content
            }
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack{
            Text(recommendation?.text ?? "Loading...")
                .font(.default)
        }
        .foregroundStyle(Color.white)
        .onChange(of: weatherData) { oldValue, newValue in
            Task {
                await generateRecommendation()
            }
        }
    }
}
