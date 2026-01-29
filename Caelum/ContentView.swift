//
//  ContentView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State var userInput: String = ""
    @State var weatherData: Weather = Weather()
    @State private var path = NavigationPath()
    @State private var onDeviceLLMModel = SystemLanguageModel.default
    var body: some View {
        NavigationStack(path: $path){
            HomeView(userInput: $userInput, weatherData: $weatherData, path: $path, onDeviceLLMModel: $onDeviceLLMModel)
                .navigationDestination(for: String.self) { destination in
                    WeatherView(userInput: $userInput, weatherData: $weatherData, onDeviceLLMModel: $onDeviceLLMModel)
                        .navigationBarBackButtonHidden(true)
                        .toolbar{
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    weatherData = Weather()
                                    $path.wrappedValue.removeLast()
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                }
        }
    }
}

#Preview {
    ContentView()
}
