//
//  HomeView.swift
//  Caelum
//
//  Created by Michael Stetter on 12/26/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var location: LocationGeocoded
    @Binding var data: WeatherData
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Caelum")
                .font(.largeTitle)
                .foregroundStyle(Color.white)

            ToolbarView(location: $location, data: $data, path: $path)
        }
        .padding(15)
        .caelumBackgroundModifier()
    }
}
