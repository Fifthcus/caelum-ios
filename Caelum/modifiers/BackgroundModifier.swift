//
//  BackgroundModifier.swift
//  Caelum
//
//  Created by Michael Stetter on 11/26/25.
//

import SwiftUI

struct CaelumBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
    }
}

extension View {
    func caelumBackgroundModifier() -> some View {
        modifier(CaelumBackgroundModifier())
    }
}
