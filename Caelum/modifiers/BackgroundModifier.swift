//
//  BackgroundModifier.swift
//  Caelum
//

import SwiftUI

struct CaelumBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
    }
}

extension View {
    func caelumBackgroundModifier() -> some View {
        modifier(CaelumBackgroundModifier())
    }
}
