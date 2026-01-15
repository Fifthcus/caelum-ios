//
//  ContainerModifier.swift
//  Caelum
//

import SwiftUI

struct CaeulumContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .glassEffect(.clear, in: .rect(cornerRadius: 10))

    }
}

extension View {
    func caelumContainerModifier() -> some View {
        modifier(CaeulumContainerModifier())
    }
}
