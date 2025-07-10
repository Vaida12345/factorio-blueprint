//
//  EntityID.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


/// An entity ID.
///
/// - Experiment: It seems it is the unique ID of this entity in a local space.
public struct EntityID: Identifiable, Codable, RawRepresentable, Sendable, CustomStringConvertible, Equatable {
    
    public var id: Int {
        self.rawValue
    }
    
    public var rawValue: Int
    
    
    public var description: String {
        "Entity #\(id)"
    }
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(Int.self)
    }
    
    
}
