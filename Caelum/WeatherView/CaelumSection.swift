//
//  SectionModifier.swift
//  Caelum
//

import SwiftUI

struct CaelumSection<Content: View>: View {
    let headerText: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack {
            Section(header: CaelumSectionHeader(headerText: .constant(headerText))) {
                content
            }
        }
        .frame(maxWidth: .infinity)
        .caelumContainerModifier()
    }
}
