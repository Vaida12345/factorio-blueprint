//
//  SignalID.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct SignalID: Codable, Equatable {
    
    /// The type of the signal. If the type is "item", this will be nil when reading.
    public var type: `Type`?
    /// Name of the prototype.
    public var name: String?
    /// The prototype name of the signal's quality. Defaults to normal.
    public var quality: Quality?
    
    public init(type: `Type`?, name: String?, quality: Quality?) {
        self.type = type
        self.name = name
        self.quality = quality
    }
    
    
    public enum `Type`: String, Codable, Equatable {
        case item, fluid, virtual, entity, recipe
        case spaceLocation = "space-location"
        case asteroidChunk = "asteroid-chunk"
        case quality = "quality"
    }
    
}


extension SignalID: CustomStringConvertible {
    
    public var description: String {
        var result = ""
        if let name {
            result += name
        }
        
        let suffix = [self.quality?.rawValue, self.type?.rawValue].compacted()
        if !suffix.isEmpty {
            if !result.isEmpty {
                result += " "
            }
            result += "(" + suffix.joined(separator: ", ") + ")"
        }
        return result
    }
}
