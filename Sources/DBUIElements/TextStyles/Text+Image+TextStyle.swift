//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

extension Text {
    func textStyle(_ textStyle: TextStyle) -> some View {
        self.modifier(TextStyleModifier(textStyle: textStyle))
    }
}


extension Image {
    func textStyle(_ textStyle: TextStyle) -> some View {
        self.modifier(TextStyleModifier(textStyle: textStyle))
    }
}
