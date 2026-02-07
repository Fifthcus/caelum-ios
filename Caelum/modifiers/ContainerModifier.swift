//
//  ContainerModifier.swift
//  Caelum
//

import SwiftUI

struct CaeulumContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color(#colorLiteral(red: 0.1242590025, green: 0.378480196, blue: 0.582894206, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func caelumContainerModifier() -> some View {
        modifier(CaeulumContainerModifier())
    }
}
