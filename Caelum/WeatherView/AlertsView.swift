//
//  AlertsView.swift
//  Caelum
//

import SwiftUI

/// A SwiftUI view which renders alerts. The data is derived from a api fetch request from www.weatherapi.com.
struct AlertsView: View {
    var alerts: Alerts
    var body: some View {
        VStack {
            if let firstAlert = alerts.alert.first {
                HStack {
                    Text("\(firstAlert.severity), \(firstAlert.event)")
                        .foregroundStyle(Color.white)
                }
                Text(firstAlert.headline)
                    .foregroundStyle(Color.white)
            }
        }
    }
}
