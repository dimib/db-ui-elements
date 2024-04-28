//
//  PrimaryButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 18.09.23.
//

import SwiftUI

public struct PrimaryButton: View, StaticButtonStylable {
    
    
    // MARK: Static Button Stylable
    public static var style: any ButtonStylable = DefaultPrimaryButtonStyle()

    let image: Image?
    let label: String
    let action: (() -> Void)
    
    public init(image: Image? = nil, label: String, action: @escaping () -> Void) {
        self.image = image
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                if let image {
                    image
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .tint(Self.style.buttonStyleForegroundColor)
                        .frame(height: 28)
                }
                Text(label)
                    .foregroundColor(Self.style.buttonStyleForegroundColor)
                    .textStyle(Self.style.buttonTextStyle)
            }
            .frame(maxWidth: .infinity, minHeight: 52)
            .padding(.horizontal, 8)
            .background(Self.style.buttonStyleBackgroundColor)
            .cornerRadius(90, corners: [.allCorners])
            .shadow(params: Self.style.buttonShadowParams)
        }
    }
    
    public func style(_ style: ButtonStyleParamsProtocol) {
        modifier(ButtonViewModifier(style: style.params))
    }
}

struct DBPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryButton(label: "Hallo", action: {})
            PrimaryButton(image: Image("iconCar"), label: "Hier parken", action: {})
        }
    }
}
