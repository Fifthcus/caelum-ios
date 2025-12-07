//
//  Weather.swift
//  Caelum
//


struct Weather: Codable {
    var description: String
    
    init(description: String) {
        self.description = description
    }
}

struct Current: Codable {
    var temp: Double
    var weather: [Weather]
    
    init(temp: Double, weather: [Weather]) {
        self.temp = temp
        self.weather = weather
    }
}

//

struct TempRange: Codable {
    var min: Double
    var max: Double
}
struct Daily: Codable {
    var temp: TempRange
}

nonisolated
struct WeatherData: Codable {
    var current: Current
    var daily: [Daily]
    
    init(current: Current, daily: [Daily]) {
        self.current = current
        self.daily = daily
    }
}
