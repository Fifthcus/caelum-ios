//
//  ContentView.swift
//  Caelum
//

import SwiftUI
import FoundationModels

/// The senior most view in the entire application.
struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State var userInput: String = ""
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            HomeView(userInput: $userInput, path: $path)
                .navigationDestination(for: String.self) { destination in
                    WeatherView(userInput: $userInput)
                        .navigationBarBackButtonHidden(true)
                        .toolbar{
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
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
