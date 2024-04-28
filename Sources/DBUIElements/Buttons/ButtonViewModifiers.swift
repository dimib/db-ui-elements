//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

public protocol ButtonStyleParamsProtocol {
    var params: ButtonStylable { get }
}

/// View Modifier for different types of shadows
public struct ButtonViewModifier: ViewModifier {
    let style: ButtonStylable
    
    public init(style: ButtonStylable) {
        self.style = style
    }
    public func body(content: Content) -> some View {
        guard var styleableContent = content as? ButtonStylable else {
            return content
        }
        styleableContent.buttonStyleForegroundColor = style.buttonStyleForegroundColor
        styleableContent.buttonStyleBackgroundColor = style.buttonStyleBackgroundColor
        styleableContent.buttonShadowParams = style.buttonShadowParams
        styleableContent.buttonTextStyle = style.buttonTextStyle
        return content
    }
}

public extension PrimaryButton {
}
