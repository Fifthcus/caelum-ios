//
//  ToolbarView.swift
//  Caelum
//
//  Created by Michael Stetter on 11/29/25.
//

import SwiftUI

struct ToolbarView: View {
    @State var inputText: String = ""
    @Binding var city: String
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
                        city = inputText
                    }
                
                //Magnifying Glass
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(20)
            .glassEffect()
            
            //Camera
            HStack{
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            .padding(20)
            .glassEffect()
        }
    }
}
