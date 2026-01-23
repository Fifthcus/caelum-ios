import Foundation

struct Condition: Decodable, Equatable {
    var text: String
    init (text: String) {
        self.text = text
    }
}
struct Day: Decodable, Equatable {
    var mintemp_f: Double
    var maxtemp_f: Double
    init (mintemp_f: Double, maxtemp_f: Double){
        self.mintemp_f = mintemp_f
        self.maxtemp_f = maxtemp_f
    }
}
struct Hour: Decodable, Equatable, Identifiable {
    var id = UUID()
    var time: String
    var temp_f: Double
    var condition: Condition
    enum CodingKeys: String, CodingKey {
        case time
        case temp_f
        case condition
    }
    func getHour(time: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = formatter.date(from: time) else {
            return "--"
        }
        
        let hour = Calendar.current.component(.hour, from: date)
            
        let ampm = hour < 12 ? "AM" : "PM"
        let currentHour = hour == 0 || hour == 12 ? 12 : hour % 12
        
        return "\(currentHour)\(ampm)"
    }
}
struct Forecastday: Decodable, Equatable {
    var day: Day
    var hour: [Hour]
    init(day: Day, hour: [Hour]) {
        self.day = day
        self.hour = hour
    }
}

struct Alert: Decodable, Equatable {
    var severity: String
    var event: String
    var headline: String
    init(severity: String, event: String, headline: String){
        self.severity = severity
        self.event = event
        self.headline = headline
    }
}

struct Alerts: Decodable, Equatable{
    var alert: [Alert]
    init(alert: [Alert]){
        self.alert = alert
    }
}

struct Location: Decodable, Equatable {
    var name: String
    var region: String
    var country: String
    init (name: String, region: String, country: String){
        self.name = name
        self.region = region
        self.country = country
    }
}
struct Forecast: Decodable, Equatable {
    var forecastday: [Forecastday]
    init (forecastday: [Forecastday]){
        self.forecastday = forecastday
    }
}
struct Current: Decodable, Equatable {
    var temp_f: Double
    var condition: Condition
    init (temp_f: Double, condition: Condition) {
        self.temp_f = temp_f
        self.condition = condition
    }
}

struct Weather: Decodable, Equatable {
    var location: Location
    var current: Current
    var forecast: Forecast
    var alerts: Alerts
    init(location: Location, current: Current, forecast: Forecast, alerts: Alerts){
        self.location = location
        self.current = current
        self.forecast = forecast
        self.alerts = alerts
    }
}
