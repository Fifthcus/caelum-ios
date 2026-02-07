//
//  ModelAvailability.swift
//  Caelum
//

import SwiftUI
import FoundationModels

///This will conditionally render specific views depending on which parent view is rendered, and if the on-device LLM from Apple Intelligence is available. This is determined through a enum, which is computed then the appropriate parent view is rendered.
struct ModelAvailabilityView: View {
    enum ModelAvailabilityEnum {
        case showMessageOnHomeView
        case showRecommender
    }
    
    var weatherData: Weather?
    var modelAvailability: ModelAvailabilityEnum
    var onDeviceLLMModel = SystemLanguageModel.default

    var body: some View {
        switch modelAvailability {
        case .showMessageOnHomeView:
            switch onDeviceLLMModel.availability {
            case .available:
                Text("This app uses Apple Intelligence to power certain features.")
                    .foregroundColor(.white)
            case .unavailable:
                Text("This app uses Apple Intelligence to power certain features. Please turn on the Apple Intelligence app in Settings.")
                    .foregroundColor(.white)
            }
        case .showRecommender:
            switch onDeviceLLMModel.availability {
            case .available:
                if let data = weatherData {
                    WeatherPrepRecommender(weatherData: data)
                }
            default:
                EmptyView()
            }
        }
    }
}

#Preview {
}
