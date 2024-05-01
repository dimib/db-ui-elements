//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 01.05.24.
//

import Foundation
import SwiftUI

/// Styliing for the `CircularSelectionView`

public protocol CircularSelectionStylable {
    var circleWidth: CGFloat  { get }   // Thickness of the circle stroke
    var circleColor: Color    { get }   // Color for the underlying circle
    var selectionColor: Color { get }   // Color for the selected part of the circle
    var thumbColor: Color     { get }   // Color for the thumb handle
    var shadow: ShadowStyleParams { get }
}

public struct CircularSelectionStyle: CircularSelectionStylable {
    public let circleWidth: CGFloat
    public let circleColor: Color
    public let selectionColor: Color
    public let thumbColor: Color
    public let shadow: ShadowStyleParams
    
    public init(circleWidth: CGFloat = 10, circleColor: Color = .gray, selectionColor: Color = .blue, thumbColor: Color = .white,
                shadow: ShadowStyleParams = .init(color: .gray, radius: 4.0, x: 1, y: 1)) {
        self.circleWidth = circleWidth
        self.circleColor = circleColor
        self.selectionColor = selectionColor
        self.thumbColor = thumbColor
        self.shadow = shadow
    }
}
