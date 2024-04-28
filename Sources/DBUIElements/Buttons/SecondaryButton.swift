//
//  SecondaryButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 22.09.23.
//

import SwiftUI

public struct SecondaryButton: View, StaticButtonStylable {
    
    // MARK: Static Button Syleable
    public static var style: any ButtonStylable = DefaultSecondaryButtonStyle()
    
    let label: String
    let action: () -> Void
    
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
            .frame(maxWidth: .infinity, minHeight: 52)
            .padding(.horizontal, 8)
            .background(Color.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 90)
                    .stroke(Self.style.buttonStyleForegroundColor, lineWidth: 2)
            }
        }
    }
    
    public func style(_ style: ButtonStyleParamsProtocol) {
        modifier(ButtonViewModifier(style: style.params))
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(label: "Secondary Button", action: { })
    }
}
