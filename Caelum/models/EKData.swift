//
//  EKData.swift
//  Caelum
//

import Foundation

struct Event: Codable {
    var id = UUID()
    var title: String
    var startDate: Date
    var endDate: Date
}
