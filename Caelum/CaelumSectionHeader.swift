//
//  ContainerHeader.swift
//  Caelum
//

import SwiftUI

struct CaelumSectionHeader: View {
    @Binding var headerText: String
    var body: some View {
        Text(headerText)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
