//
//  ContainerModifier.swift
//  Caelum
//

import SwiftUI

struct CaeulumContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(maxWidth: .infinity)
            .glassEffect(.regular.tint(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))).interactive(), in: .rect(cornerRadius: 10))

    }
}

extension View {
    func caelumContainerModifier() -> some View {
        modifier(CaeulumContainerModifier())
    }
}
