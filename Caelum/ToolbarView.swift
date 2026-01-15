//
//  ToolbarView.swift
//  Caelum
//

import SwiftUI

struct ToolbarView: View {
    @State var inputText: String = ""
    @Binding var userInput: String
    @Binding var weatherData: Weather
    @Binding var path: NavigationPath
    
    func navigateToNewView(){
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
        Button("Get my location"){
            print("testing")
        }
            .foregroundStyle(Color.white)
            .padding()
    }
}
