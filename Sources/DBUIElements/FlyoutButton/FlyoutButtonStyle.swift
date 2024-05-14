//
//  File.swift
//  
//
//  Created by Dimitri Brukakis on 14.05.24.
//

import SwiftUI

struct FlyoutButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .foregroundColor(textColor(configuration))
                .controlSize(.small)
        }
        .frame(minWidth: 64, minHeight: 64)
        .background(Circle()
            .foregroundColor(color(configuration))
        )
        .shadow(params: shadowParam(configuration))
    }

    func color(_ configuration: Configuration) -> Color {
        if configuration.isPressed { return Color.blue.opacity(0.9) }
        return Color.blue
    }
    func textColor(_ configuration: Configuration) -> Color {
        if configuration.isPressed { return Color.white.opacity(0.3) }
        return Color.white
    }
    
    func shadowParam(_ configuration: Configuration) -> ShadowStyleParams {
        configuration.isPressed
            ? ShadowStyleParams(color: .gray.opacity(0.6), radius: 2.0, x: 2.0, y: 2.0)
            : ShadowStyleParams(color: .gray, radius: 2.0, x: 2.0, y: 2.0)
    }
}

struct FlyoutItemButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .foregroundColor(textColor(configuration))
                .controlSize(.small)
        }
//        .frame(width: 200, height: 24)
    }

    func color(_ configuration: Configuration) -> Color {
        if configuration.isPressed { return Color.blue.opacity(0.9) }
        return Color.blue
    }
    func textColor(_ configuration: Configuration) -> Color {
        if configuration.isPressed { return Color.white.opacity(0.3) }
        return Color.black
    }
    
    func shadowParam(_ configuration: Configuration) -> ShadowStyleParams {
        configuration.isPressed
            ? ShadowStyleParams(color: .gray.opacity(0.6), radius: 2.0, x: 2.0, y: 2.0)
            : ShadowStyleParams(color: .gray, radius: 2.0, x: 2.0, y: 2.0)
    }
}
