//
//  SectionModifier.swift
//  Caelum
//

import SwiftUI

struct CaelumSection<Content: View>: View {
    let icon: String
    let headerText: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack {
            Section(header: CaelumSectionHeader(icon: .constant(icon), headerText: .constant(headerText))) {
                content
            }
        }
        .frame(maxWidth: .infinity)
        .caelumContainerModifier()
    }
}
