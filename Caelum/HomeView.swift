//
//  HomeView.swift
//  Caelum
//

import SwiftUI

struct HomeView: View {
    @Binding var userInput: String
    @Binding var weatherData: Weather
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Caelum")
                .font(.largeTitle)
                .foregroundStyle(Color.white)

            ToolbarView(userInput: $userInput, weatherData: $weatherData, path: $path)
        }
        .padding(15)
        .caelumBackgroundModifier()
    }
}
