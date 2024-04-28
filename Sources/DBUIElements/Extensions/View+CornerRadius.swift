//
//  View+CornerRadius.swift
//
//  Created by Dimitri Brukakis on 13.09.23.
//

import Foundation
import SwiftUI

/// Define corner radiusses only for specific corners.
/// Taken from https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
public struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


