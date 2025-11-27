//
//  ContentView.swift
//  Caelum
//
//  Created by Michael Stetter on 11/26/25.
//

import SwiftUI


struct ContentView: View {
    @State private var inputText: String = ""
    @State private var city: String = ""
    var body: some View {
        VStack{
            VStack{
                //Title
                Text("Caelum")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                
                //Data
                Text(city)
                    .foregroundStyle(Color.white)
            }
            
            if !city.isEmpty{
                Spacer()
            }
            
            //Bottom Toolbar
            VStack{
                HStack {
                    //Search Bar
                    HStack{
                        //Search Field
                        TextField(
                            "Search for a city",
                            text: $inputText
                        )
                            .onSubmit {
                                city = inputText
                            }
                        
                        //Magnifying Glass
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    .padding(15)
                    .glassEffect()
                    
                    
                    
                    //Camera
                    HStack{
                        Image(systemName: "camera")
                            .foregroundColor(.gray)
                    }
                    .padding(15)
                    .glassEffect()
                }
                .padding(.horizontal, 10)
            }
        }
        .caelumBackgroundModifier()
    }
}

#Preview {
    ContentView()
}
