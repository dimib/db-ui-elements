//
//  SmallButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 22.09.23.
//

import SwiftUI

public struct SmallPrimaryButton: View, StaticButtonStylable {
    
    // MARK: Static Button Styleable
    public static var style: any ButtonStylable = DefaultSmallPrimaryButtonStyle()

    let label: String
    let action: (() -> Void)
    
    public init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack {
                Text(label)
                    .foregroundColor(Self.style.buttonStyleForegroundColor)
                    .textStyle(Self.style.buttonTextStyle)
            }
            .frame(minHeight: 24)
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .background(Self.style.buttonStyleBackgroundColor)
            .cornerRadius(90, corners: [.allCorners])
        }
    }

    public func style(_ style: ButtonStyleParamsProtocol) {
        modifier(ButtonViewModifier(style: style.params))
    }
}

struct SmallPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallPrimaryButton(label: "Small Button", action: {})
    }
}
