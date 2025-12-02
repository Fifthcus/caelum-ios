//
//  ContentView.swift
//  Caelum
//
//  Created by Michael Stetter on 11/26/25.
//

import SwiftUI


struct ContentView: View {
    @State var city: String = ""
    var body: some View {
        VStack{
            //Title
            if city.isEmpty {
                Text("Caelum")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            } else {
                WeatherView(city: $city)
                    .padding(75)
                Spacer()
            }
            ToolbarView(city: $city)
        }
        .padding(15)
        .caelumBackgroundModifier()
    }
}

#Preview {
    ContentView()
}
