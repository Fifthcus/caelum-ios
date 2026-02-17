//
//  DecodeSecrets.swift
//  Caelum
//

import Foundation

enum Secrets{
     static var apiKey: String {
         guard let key = Bundle.main.infoDictionary?["WEATHERAPI_API_KEY"] as? String else {
             fatalError("API key not found within Secrets.xcconfig")
         }
         return key
    }
}
