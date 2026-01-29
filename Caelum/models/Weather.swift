import Foundation

struct Condition: Decodable, Equatable {
    var text: String = ""
}
struct Day: Decodable, Equatable {
    var mintemp_f: Double = 0.0
    var maxtemp_f: Double = 0.0
}
struct Hour: Decodable, Equatable, Identifiable {
    var id = UUID()
    var time: String = ""
    var temp_f: Double = 0.0
    var condition: Condition = Condition(text: "")
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
    var day: Day = Day(mintemp_f: 0.0, maxtemp_f: 0.0)
    var hour: [Hour] = []
}

struct Alert: Decodable, Equatable {
    var severity: String = ""
    var event: String = ""
    var headline: String = ""
}

struct Alerts: Decodable, Equatable{
    var alert: [Alert] = []
}

struct Location: Decodable, Equatable {
    var name: String = ""
    var region: String = ""
    var country: String = ""
}
struct Forecast: Decodable, Equatable {
    var forecastday: [Forecastday] = []
}
struct Current: Decodable, Equatable {
    var temp_f: Double = 0.0
    var condition: Condition = Condition(text: "")
}

struct Weather: Decodable, Equatable {
    var location: Location = Location(name: "", region: "", country: "")
    var current: Current = Current(temp_f: 0.0, condition: Condition(text: ""))
    var forecast: Forecast = Forecast(forecastday: [])
    var alerts: Alerts = Alerts(alert: [])
}
