//
//  AlertsView.swift
//  Caelum
//

import SwiftUI

struct AlertsView: View {
    @Binding var alerts: Alerts
    var body: some View {
        VStack {
            if let firstAlert = alerts.alert.first {
                HStack {
                    Text("\(firstAlert.severity), \(firstAlert.event)")
                        .foregroundStyle(Color.white)
                }
                Text(firstAlert.headline)
                    .foregroundStyle(Color.white)
            } else {
                
            }
        }
    }
}
