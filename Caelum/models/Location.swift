//
//  Location.swift
//  Caelum
//

nonisolated
struct LocationGeocoded: Decodable{
    var name: String
    var lat: Double
    var lon: Double
    var state: String?
    var country: String
    
    init(name: String, lat: Double, lon: Double, state: String?, country: String) {
        self.name = name
        self.lat = lat
        self.lon = lon
        self.state = state
        self.country = country
    }
}
