//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import Foundation
import SwiftUI

// MARK: - Button styleable protocol

/// Use this protocol to define app specific button styles. 
public protocol ButtonStylable {
    var buttonStyleForegroundColor: Color { get set }
    var buttonStyleBackgroundColor: Color { get set }
    var buttonTextStyle: TextStyleParams { get set }
    var buttonShadowParams: ShadowStyleParams { get set }
}

public protocol StaticButtonStylable {
    static var style: ButtonStylable { get set }
}

// MARK: - Default button styles

struct DefaultPrimaryButtonStyle: ButtonStylable {
    var buttonStyleForegroundColor = Color.white
    var buttonStyleBackgroundColor = Color.blue
    var buttonTextStyle = TextStyleParams()
    var buttonShadowParams = ShadowStyleParams()
}

struct DefaultSmallPrimaryButtonStyle: ButtonStylable {
    var buttonStyleForegroundColor = Color.white
    var buttonStyleBackgroundColor = Color.blue
    var buttonTextStyle = TextStyleParams()
    var buttonShadowParams = ShadowStyleParams()
}

struct DefaultSecondaryButtonStyle: ButtonStylable {
    var buttonStyleForegroundColor = Color.blue
    var buttonStyleBackgroundColor = Color.clear
    var buttonTextStyle = TextStyleParams()
    var buttonShadowParams = ShadowStyleParams()
}

struct DefaultSmallSecondaryButtonStyle: ButtonStylable {
    var buttonStyleForegroundColor = Color.blue
    var buttonStyleBackgroundColor = Color.clear
    var buttonTextStyle = TextStyleParams()
    var buttonShadowParams = ShadowStyleParams()
}

struct DefaultTertiaryButtonStyle: ButtonStylable {
    var buttonStyleForegroundColor = Color.white
    var buttonStyleBackgroundColor = Color.blue
    var buttonTextStyle = TextStyleParams()
    var buttonShadowParams = ShadowStyleParams()
}
