//
//  ContainerModifier.swift
//  Caelum
//

import SwiftUI

struct CaeulumContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .glassEffect(.clear, in: .rect(cornerRadius: 10))

    }
}

extension View {
    func caelumContainerModifier() -> some View {
        modifier(CaeulumContainerModifier())
    }
}
