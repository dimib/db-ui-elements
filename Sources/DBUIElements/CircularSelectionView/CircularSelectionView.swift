//
//  CircularSelectionView.swift
//  ParkReminder
//
//  Created by Dimitri Brukakis on 06.10.23.
//

import SwiftUI

/// The `CircularSelectionView` works like a circular slider.
/// It can be used for selecting durations, values from ranges etc.
/// The type of value, a range and fraction can be specified.
/// Types of value:
/// - Duration / Time
public struct CircularSelectionView: View {
    
    // MARK: - View State
    @State var size: CGSize = .zero
    @State var center: CGPoint = .zero
    @State var radius: CGFloat = 0

    @State var indicatorOffset: CGSize = .init(width: -150, height: 0)
    @State var selectionDegree: CGFloat = 0
    
    @Binding var value: Double
    
    // MARK: - Properties
    private let isEditable: Bool        // Flag, if a value can be changed
    private let style: CircularSelectionStylable
    
    private let onChange: ((Double) -> Void)?
    
    /// Use this constructor when you want to use a binding for monitor changes of the selction value.
    /// - parameter style: Colors and sizes
    /// - parameter editable: if true, we can change the value by dragging the thumb handle
    /// - parameter value: Binding for changing and monitoring the value
    public init(value: Binding<Double>, editable: Bool = true,
                style: CircularSelectionStylable = CircularSelectionStyle()) {
        self.isEditable = editable
        self.style = style
        self._value = value
        self.onChange = nil
    }

    /// Use this constructor when you can use the binding for changing and monitoring the value.
    /// In this case we set the initial value and get updates with the `onChange` callback.
    /// - parameter style: Colors and sizes
    /// - parameter editable: if true, we can change the value by dragging the thumb handle
    /// - parameter value: Binding for changing and monitoring the value
    /// - parameter onChange. Callback for getting the changed value.
    public init(value: Double, editable: Bool = true,
         style: CircularSelectionStylable = CircularSelectionStyle(),
         onChange: ((Double) -> Void)? = nil) {
        self.style = style
        self.isEditable = editable
        self._value = .constant(value)
        self.onChange = onChange
    }

    public var body: some View {
        VStack {
            ZStack {
                Circle() // Background Circle
                    .stroke(style.circleColor, style: StrokeStyle(lineWidth: style.circleWidth))
                    .shadow(params: style.shadow)
                
                Circle() // Selection Cirlce
                    .trim(from: 0.0, to: calculateTrimTo(angle: selectionDegree))
                    .stroke(style.selectionColor, style: StrokeStyle(lineWidth: style.circleWidth, lineCap: .round))
                    .rotationEffect(.degreesNorth(0))
                
                if isEditable {
                    Circle() // Handle
                        .trim(from: 0.0, to: 0.001)
                        .stroke(style.thumbColor, style: StrokeStyle(lineWidth: style.circleWidth, lineCap: .round))
                        .rotationEffect(.degreesNorth(selectionDegree))
                        .gesture(
                            DragGesture(coordinateSpace: .local)
                                .onChanged{ value in
                                    selectionDegree = calculateAngle(point: value.location, turn: 90)
                                    if let onChange = self.onChange {
                                        // If we have a callback that takes the new value, we use this.
                                        onChange(calculateTrimTo(angle: selectionDegree))
                                    } else {
                                        // Otherwise we will just change the binding.
                                        self.value = calculateTrimTo(angle: selectionDegree)
                                    }
                                }
                        )
                }
            }
            .background(
                GeometryReader { geometry in
                    Color.clear.onAppear {
                        size = geometry.frame(in: .local).size
                        center = CGPoint(x: size.width / 2, y: size.height / 2)
                        radius = size.width / 2
                    }
                }
            )
        }
        .padding(style.circleWidth / 2)
        .onAppear {
            selectionDegree = CGFloat(value * 360.0)
        }
        .onChange(of: value) { oldValue, newValue in
            withAnimation {
                selectionDegree = CGFloat(newValue * 360.0)
            }
        }
    }
    
    /// This function will just calculate the angle in the center to the point on the circle.
    /// - parameter point: The point from the drag gesture
    /// - parameter turn: Add / subtract angle when turning the circle
    private func calculateAngle(point: CGPoint, turn: Double = 0) -> Double {
        let deltaX = point.x - center.x
        let deltaY = point.y - center.y
        let angleRadians = atan2(deltaY, deltaX)
        let angleDegree = (angleRadians * 180 / Double.pi) + turn
        return angleDegree < 0 ? 360 + angleDegree : angleDegree
    }
    
    /// This will calculate the `to:` value of the trim for the _completion_ circle.
    /// - parameter angle: Angle of the point on the circle
    /// - returns the percentage of the completion based on the angle
    private func calculateTrimTo(angle: Double) -> Double {
        angle / 360
    }
}

// MARK: - Angle extension
private extension Angle {
    static func degreesNorth(_ degrees: Double) -> Angle {
        Angle.degrees(-90 + degrees)
    }
}

// MARK: - View Modifier

// MARK: -- Preview

struct CircularSelectionView_Previews: PreviewProvider {
    @State static var value: Double = 0.5
    
    static var previews: some View {
        CircularSelectionView(value: $value, editable: false)
            .frame(width: 300, height: 300)
    }
}
