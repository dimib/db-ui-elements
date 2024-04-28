//
//  PrimaryButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 18.09.23.
//

import SwiftUI

struct PrimaryButton: View {
    let image: Image?
    let label: String
    let action: (() -> Void)
    
    init(image: Image? = nil, label: String, action: @escaping (() -> Void)) {
        self.image = image
        self.label = label
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                if let image {
                    image
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .tint(Color.textOnButtonPrimary)
                        .frame(height: 28)
                }
                Text(label)
                    .foregroundColor(Color.textOnButtonPrimary)
                    .textStyle(.button)
            }
            .frame(maxWidth: .infinity, minHeight: 52)
            .padding(.horizontal, 8)
            .background(Color.buttonPrimary)
            .cornerRadius(90, corners: [.allCorners])
            .shadow(type: .card)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryButton(label: "Hallo", action: {})
            PrimaryButton(image: Image("iconCar"), label: "Hier parken", action: {})
        }
    }
}
