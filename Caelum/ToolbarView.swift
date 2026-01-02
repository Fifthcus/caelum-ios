//
//  ToolbarView.swift
//  Caelum
//

import SwiftUI

struct ToolbarView: View {
    @State var inputText: String = ""
    @Binding var location: LocationGeocoded
    @Binding var data: WeatherData
    @Binding var path: NavigationPath
    
    func navigateToNewView(){
        location.name = inputText
        path.append("weather")
        inputText = ""
    }
    
    var body: some View {
        HStack {
            //Search Bar
            HStack{
                //Search Field
                TextField(
                    "Search for a city",
                    text: $inputText
                )
                .onSubmit {
                    navigateToNewView()
                }
            }
            .padding(20)
            .glassEffect()
            //Magnifying Glass
            HStack{
                Button(action: navigateToNewView){
                    Image(systemName: "magnifyingglass")
                }
            }
            .padding(20)
            .glassEffect()
             
        }
        Button("Get my location"){
            print("testing")
        }
            .foregroundStyle(Color.white)
            .padding()
    }
}
