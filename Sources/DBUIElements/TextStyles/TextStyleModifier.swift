//
//  TextStyleModifier.swift
//
//
//  Created by Dimitri Brukakis on 28.04.24.
//

import SwiftUI

/// View Modifier that translates text styles into font and line spacing view modifiers.
/// For dynamic type we need the environment `.sizeCategory` and scale the font size and line height
/// using `UIFontMetrics`.
struct TextStyleModifier: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory

    let textStyle: TextStyleParams

    var font: Font {
        let size = min(UIFontMetrics.default.scaledValue(for: textStyle.fontSize), textStyle.fontSize * 1.5)
        let font = Font.system(size: size, weight: textStyle.fontWeight, design: textStyle.fontDesign)
        return font
    }
    var lineSpacing: CGFloat {
        return textStyle.lineSpacing
    }
    func body(content: Content) -> some View {
        return content
                .font(font)
//                .lineSpacing(lineSpacing)
    }
}
