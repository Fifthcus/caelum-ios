//
//  HomeView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

/// Displays the applications Home screen. Which consists of a header and a text field the user will user to enter a city they would like to search the weather data for.
struct HomeView: View {
    @Binding var userInput: String
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Spacer()
            Text("Caelum")
                .font(.largeTitle)
                .foregroundStyle(Color.white)

            ToolbarView(userInput: $userInput, path: $path)
            Spacer()
            ModelAvailabilityView(modelAvailability: .showMessageOnHomeView)
        }
        .padding(15)
        .caelumBackgroundModifier()
    }
}
