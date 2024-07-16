//
//  DurationCalculator.swift
//  ParkReminder
//
//  Created by Dimitri Brukakis on 15.10.23.
//

import Foundation

/// Calculate the number of hours and minutes depending on the time range (6 hours, 12 hours, 24 hours ...)
/// given the percentage from the circular selection view
public struct DurationCalculator: Sendable {
    
    /// Time range in minutes
    private let timeRange: Int
    
    /// Steps in minutes (e.g. 5 minutes, 15 minutes)
    private let steps: Int
    
    /// Constructor with timeRange and steps
    public init(timeRange: Int, steps: Int = 1) {
        self.timeRange = timeRange
        self.steps = steps
    }
    
    /// Calculates the number of minutes depending of the specified fraction (0.0...1.0)
    public func calculateMinutes(fraction: Double) -> Int {
        guard steps > 0 else {
            return Int(Double(timeRange) * fraction)
        }
        let minutes = Int(Double(timeRange) * fraction)
        return minutes - (minutes % steps)
    }
    
    /// Calculates the number of hours and minutes depending on the specified fraction (0.0...1.0)
    public func hoursAndMinutes(fraction: Double) -> (hours: Int, minutes: Int) {
        let duration = calculateMinutes(fraction: fraction)
        
        let hours = Int(duration / 60)
        let min = Int(duration - (hours * 60))
        return (hours, min)
    }
    
    /// Calculates the fraction for the specified minutes depending on the range.
    public func fraction(minutes: Int) -> Double {
        Double(minutes) / Double(timeRange)
    }
    // MARK: - Construction
    public static let sixHours = DurationCalculator(timeRange: 361, steps: 5)
    public static let twelveHours = DurationCalculator(timeRange: 721, steps: 15)
    public static let twentyfourHours = DurationCalculator(timeRange: 1441, steps: 15)
}
