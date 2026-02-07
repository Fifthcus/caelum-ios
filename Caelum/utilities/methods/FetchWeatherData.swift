//
//  FetchWeatherData.swift
//  Caelum
//

import Foundation

/// Fetches the weather data for the user provided location from www.weatherapi.com
///
/// - Parameters:
///   - userInput: a string containing the name or coordinates of the locale the user wishes to determine the weather for.
///
/// - Returns: Returns the current weather data for the user provided locale.
func fetchWeatherData(userInput: String) async -> Weather {
    let key = Secrets.apiKey
    do{
        if key != "" {
            let url: URL = URL(string:"https://api.weatherapi.com/v1/forecast.json?key=\(key)&q=\(userInput)&days=1&aqi=no&alerts=yes")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(Weather.self, from: data)
            return decoded
        }
    } catch {
        print(error)
    }
    return Weather()
}
