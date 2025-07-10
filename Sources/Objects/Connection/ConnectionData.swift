//
//  ConnectionData.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


/// Information about a single connection between two connection points.
public struct ConnectionData: Codable, Sendable, Equatable {
    
    /// ID of the entity this connection is connected with.
    public var entityID: EntityID
    
    /// The circuit connector id of the entity this connection is connected to.
    public var circuitID: Int
    
    
    public init(entityID: EntityID, circuitID: Int) {
        self.entityID = entityID
        self.circuitID = circuitID
    }
    
    
    enum CodingKeys: String, CodingKey {
        case entityID = "entity_id"
        case circuitID = "circuit_id"
    }
}

extension ConnectionData: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<ConnectionData>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.entityID)
            descriptor.value(for: \.circuitID)
        }
    }
}
