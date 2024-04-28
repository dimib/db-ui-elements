//
//  SmallSecondaryButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 22.09.23.
//

import SwiftUI

public struct SmallSecondaryButton: View, StaticButtonStylable {

    // MARK: Button Styleable
    public static var style: any ButtonStylable = DefaultSmallSecondaryButtonStyle()

    let label: String
    let action: (() -> Void)
    
    public init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            ZStack {
                Text(label)
                    .textStyle(Self.style.buttonTextStyle)
                    .foregroundColor(Self.style.buttonStyleForegroundColor)
            }
            .frame(minHeight: 20)
            .background(Color.clear)
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
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

struct SmallSecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallSecondaryButton(label: "Small Secondary Button", action: {})
    }
}
