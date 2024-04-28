//
//  Text+Image+TextStyle.swift
//  
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

public extension Text {
    public func textStyle(_ paramsProtocol: TextStyleParamsProtocol) -> some View {
        self.modifier(TextStyleModifier(textStyle: paramsProtocol.params))
    }
    public func textStyle(_ params: TextStyleParams) -> some View {
        self.modifier(TextStyleModifier(textStyle: params))
    }
}

public extension Image {
    public func textStyle(_ paramsProtocol: TextStyleParamsProtocol) -> some View {
        self.modifier(TextStyleModifier(textStyle: paramsProtocol.params))
    }
    public func textStyle(_ params: TextStyleParams) -> some View {
        self.modifier(TextStyleModifier(textStyle: params))
    }
}
