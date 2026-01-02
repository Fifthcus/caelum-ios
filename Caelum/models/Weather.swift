//
//  Weather.swift
//  Caelum
//


struct Weather: Codable, Equatable {
    var description: String
    
    init(description: String) {
        self.description = description
    }
}

struct Current: Codable, Equatable {
    var temp: Double
    var weather: [Weather]
    
    init(temp: Double, weather: [Weather]) {
        self.temp = temp
        self.weather = weather
    }
}

//

struct TempRange: Codable, Equatable {
    var min: Double
    var max: Double
}
struct Daily: Codable, Equatable {
    var temp: TempRange
}

nonisolated
struct WeatherData: Codable, Equatable {
    var current: Current
    var daily: [Daily]
    
    init(current: Current, daily: [Daily]) {
        self.current = current
        self.daily = daily
    }
}
