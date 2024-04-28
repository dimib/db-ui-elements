//
//  SmallButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 21.09.23.
//

import SwiftUI

public struct TertiaryButton: View, StaticButtonStylable {
    
    // MARK: Button Stylable
    public static var style: any ButtonStylable = DefaultTertiaryButtonStyle()

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
            .frame(maxWidth: .infinity, minHeight: 16)
            .padding(2)
            .background(.clear)
        }
    }
    public func style(_ style: ButtonStyleParamsProtocol) {
        modifier(ButtonViewModifier(style: style.params))
    }
}

struct TertiaryButton_Previews: PreviewProvider {
    static var previews: some View {
        TertiaryButton(label: "Hallo", action: {})
    }
}
