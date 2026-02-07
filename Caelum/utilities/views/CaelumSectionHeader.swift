//
//  ContainerHeader.swift
//  Caelum
//

import SwiftUI

///  The header portion of the CaelumSection view. Displaying both an apprioriate icon and header text.
struct CaelumSectionHeader: View {
    @Binding var icon: String
    @Binding var headerText: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            Text(headerText)
                .foregroundStyle(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}
