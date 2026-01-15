//
//  ContainerHeader.swift
//  Caelum
//

import SwiftUI

struct ContainerHeader: View {
    @Binding var header: String
    var body: some View {
        Text(header)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    @Previewable @State var header: String = "Test"
    ContainerHeader(header: $header)
}
