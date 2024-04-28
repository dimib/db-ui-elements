//
//  View+Shadow.swift
//
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

/// View Modifier for different types of shadows
public struct ShadowModifier: ViewModifier {
    let shadowParams: ShadowStyleParams
    
    public init(params: ShadowStyleParams) {
        self.shadowParams = params
    }
    public func body(content: Content) -> some View {
        return content
            .shadow(color: shadowParams.color, radius: shadowParams.radius,
                    x: shadowParams.offsetX, y: shadowParams.offsetY)
    }
}

extension View {
    func shadow(params: ShadowStyleParams) -> some View {
        self.modifier(ShadowModifier(params: params))
    }
}
