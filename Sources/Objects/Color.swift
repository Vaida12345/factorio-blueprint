//
//  Color.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct Color: Equatable, Codable, Sendable {
    
    public var red: Double
    public var green: Double
    public var blue: Double
    public var alpha: Double
    
    public var components: SIMD4<Double> {
        [red, green, blue, alpha]
    }
    
    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    enum CodingKeys: String, CodingKey {
        case red = "r"
        case green = "g"
        case blue = "b"
        case alpha = "a"
    }
}


extension Color: CustomStringConvertible {
    
    public var description: String {
        var result = ""
        if #available(macOS 12, *) {
            result += "Color(red: \(self.red.formatted(.percent.precision(.fractionLength(0)))), green: \(self.green.formatted(.percent.precision(.fractionLength(0)))), red: \(self.blue.formatted(.percent.precision(.fractionLength(0))))"
        } else {
            result += "Color(red: \(self.red), green: \(self.green), red: \(self.blue)"
        }
        
        if alpha != 1 {
            if #available(macOS 12, *) {
                result += ", alpha: \(self.alpha.formatted(.percent.precision(.fractionLength(0)))))"
            } else {
                result += ", alpha: \(self.alpha))"
            }
        } else {
            result += ")"
        }
        
        return result
    }
}
