//
//  HomeView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

struct HomeView: View {
    @Binding var userInput: String
    @Binding var weatherData: Weather
    @Binding var path: NavigationPath
    @Binding var onDeviceLLMModel: SystemLanguageModel
    var onDeviceLLMModelMessage: String = "This app uses Apple Intelligence to power certain features."

    var body: some View {
        VStack {
            Spacer()
            Text("Caelum")
                .font(.largeTitle)
                .foregroundStyle(Color.white)

            ToolbarView(userInput: $userInput, weatherData: $weatherData, path: $path)
            Spacer()
            //Check model availability
            switch onDeviceLLMModel.availability {
            case .available:
                Text(onDeviceLLMModelMessage)
                    .foregroundStyle(Color.white)
            case .unavailable(.deviceNotEligible):
                Text("\(onDeviceLLMModelMessage) But your device does not support Apple Intelligence.")
                    .foregroundStyle(Color.white)
            case .unavailable(.modelNotReady):
                Text("\(onDeviceLLMModelMessage) Check in settings to determine if Apple Intelligence is ready.")
                    .foregroundStyle(Color.white)
            case .unavailable(.appleIntelligenceNotEnabled), .unavailable(_):
                Text("\(onDeviceLLMModelMessage) But Apple Intelligence is not enabled on your device.")
                    .foregroundStyle(Color.white)
            }
        }
        .padding(15)
        .caelumBackgroundModifier()
    }
}
