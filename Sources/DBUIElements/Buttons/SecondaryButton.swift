//
//  SecondaryButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 22.09.23.
//

import SwiftUI

struct SecondaryButton: View {
    let label: String
    let action: (() -> Void)
    var body: some View {
        Button(action: action) {
            VStack {
                Text(label)
                    .foregroundColor(Color.buttonPrimary)
                    .textStyle(.button)
            }
            .frame(maxWidth: .infinity, minHeight: 52)
            .padding(.horizontal, 8)
            .background(Color.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 90)
                    .stroke(Color.buttonPrimary, lineWidth: 2)
            }
        }
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(label: "Secondary Button", action: { })
    }
}
