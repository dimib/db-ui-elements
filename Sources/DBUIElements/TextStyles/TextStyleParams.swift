//
//  TextStyleParams.swift
//  
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

/// Implement this protocol in enums to easily assign text styles
public protocol TextStyleParamsProtocol {
    var params: TextStyleParams { get }
}

/// Text styles just defines how text views will look like. Styles should
/// be prefered before setting fonts or other text specific parameters.
public struct TextStyleParams {
    public let fontSize: CGFloat
    public let fontWeight: Font.Weight
    public let fontDesign: Font.Design
    public let lineSpacing: CGFloat
    
    public init(fontSize: CGFloat = 16, fontWeight: Font.Weight = .medium, fontDesign: Font.Design = .default, lineSpacing: CGFloat = 1) {
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.fontDesign = fontDesign
        self.lineSpacing = lineSpacing
    }
}
