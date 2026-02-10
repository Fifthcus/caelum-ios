//
//  ToolbarView.swift
//  Caelum
//

import SwiftUI

/// When the user submit the locale they wish to determine weather data for, the app navigates to a view which will render the data the app fetched from www.weatherapi.com
struct ToolbarView: View {
    @State var inputText: String = ""
    @Binding var userInput: String
    @FocusState var isTextFieldFocused: Bool
    @Binding var path: NavigationPath
    
    func navigateToNewView(userInput: String, path: NavigationPath){
        isTextFieldFocused = false
        if !userInput.isEmpty{
            self.path.append("weather")
        }
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
                    isTextFieldFocused = false
                    userInput = inputText
                    navigateToNewView(userInput: userInput, path: path)
                    inputText = ""
                }
            }
            .foregroundStyle(Color.white)
            .padding(20)
            .glassEffect(.clear)
            
            //Magnifying Glass
            HStack{
                Button(action: {
                    isTextFieldFocused = false
                    userInput = inputText
                    navigateToNewView(userInput: userInput, path: path)
                    inputText = ""
                }){
                    Image(systemName: "magnifyingglass")
                }
            }
            .foregroundStyle(Color.white)
            .padding(20)
            .glassEffect(.clear)
             
        }
        CurrentLocation(userInput: $userInput, path: $path)
    }
}
