//
//  ShadowParams.swift
//
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

/// Implement this protocol in enums to easily assign shadow styles
public protocol ShadowStyleParamsProtocol {
    var params: ShadowStyleParams { get }
}

/// Parameters that define a shadow style. We use color, radius and offsets.

public struct ShadowStyleParams {
    public let color: Color
    public let radius: CGFloat
    public let offsetX: CGFloat
    public let offsetY: CGFloat
    
    public init(color: Color = .black, radius: CGFloat = 4.0, x: CGFloat = 3.0, y: CGFloat = 3.0) {
        self.color = color
        self.radius = radius
        self.offsetX = x
        self.offsetY = x
    }
}
