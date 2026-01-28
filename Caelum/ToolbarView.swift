//
//  ToolbarView.swift
//  Caelum
//

import SwiftUI

struct ToolbarView: View {
    @State var inputText: String = ""
    @Binding var userInput: String
    @FocusState var isTextFieldFocused: Bool
    @Binding var weatherData: Weather
    @Binding var path: NavigationPath
    
    func navigateToNewView(){
        isTextFieldFocused = false
        userInput = inputText
        path.append("weather")
        inputText = ""
    }
    
    var body: some View {
        HStack {
            //Search Bar
            HStack{
                //Search Field
                TextField(
                    "",
                    text: $inputText,
                    prompt: Text("Enter a city")
                        .foregroundStyle(Color(#colorLiteral(red: 0.8734392524, green: 0.912833333, blue: 0.9223466516, alpha: 1)))
                )
                .focused($isTextFieldFocused)
                .foregroundStyle(Color.white)
                .onSubmit {
                    navigateToNewView()
                }
            }
            .foregroundStyle(Color.white)
            .padding(20)
            .glassEffect(.clear)
            
            //Magnifying Glass
            HStack{
                Button(action: navigateToNewView){
                    Image(systemName: "magnifyingglass")
                }
            }
            .foregroundStyle(Color.white)
            .padding(20)
            .glassEffect(.clear)
             
        }
        CurrentLocation(weatherData: $weatherData, userInput: $userInput, path: $path)
    }
}
