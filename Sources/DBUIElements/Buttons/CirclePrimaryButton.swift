//
//  PrimaryCircleButton.swift
//  ParkReminder
//
//  Created by Dimitri Brukakis on 08.11.23.
//

import SwiftUI

public struct CirclePrimaryButton: View, StaticButtonStylable {

    // MARK: Button styleable
    public static var style: any ButtonStylable = DefaultPrimaryButtonStyle()

    let image: Image
    let action: () -> Void
    
    public init(image: Image, action: @escaping () -> Void) {
        self.image = image
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack {
                image
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .tint(Self.style.buttonStyleForegroundColor)
                    .frame(height: 22)
            }
            .frame(minWidth: 44, minHeight: 44)
            .background(Circle()
                .foregroundColor(Self.style.buttonStyleBackgroundColor)
                .shadow(params: Self.style.buttonShadowParams))
        }
    }
    public func style(_ style: ButtonStyleParamsProtocol) {
        modifier(ButtonViewModifier(style: style.params))
    }
}

struct CirclePrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CirclePrimaryButton(image: Image("iconCar"), action: {})
        }
    }
}
