//
//  Direction.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-11.
//


/// The direction to which the entity is facing.
///
/// It has 16 directions, dividing a circle evenly clockwise. In this implementation, it uses standard compass bearings.
///
/// - Note: If not specified, it is facing ``north``.
///
/// In the example blow, the directions are ``north``, ``east``, ``south``, and ``west``.
///
/// ![example](belts_directions)
public enum Direction: Int, Codable {
    /// The entity is facing upwards.
    ///
    /// This is the default direction, the direction when you select an entity is factorio.
    case north = 0
    /// The entity is facing towards right hand side.
    case east = 4
    /// The entity is facing downwards.
    case south = 8
    /// The entity is facing towards left hand side.
    case west = 12
    
    case northNorthEast = 1 // 22.5°
    case northEast = 2     // 45°
    case eastNorthEast = 3 // 67.5°
    
    case eastSouthEast = 5 // 112.5°
    case southEast = 6     // 135°
    case southSouthEast = 7 // 157.5°
    
    case southSouthWest = 9 // 202.5°
    case southWest = 10     // 225°
    case westSouthWest = 11 // 247.5°
    
    case westNorthWest = 13 // 292.5°
    case northWest = 14     // 315°
    case northNorthWest = 15 // 337.5°
    
    
    public static func bearing(degree: Double) -> Direction {
        let normalized = (degree.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        let index = Int((normalized + 11.25) / 22.5) % 16
        return Direction(rawValue: index)!
    }
    
    /// Standard compass bearing in degrees.
    public var bearing: Double {
        Double(rawValue) * 22.5
    }
}
