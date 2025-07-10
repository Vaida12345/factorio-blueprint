//
//  Connection.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


/// Object containing information about the connections to other entities formed by red or green wires.
public struct Connection: Codable, Sendable, Equatable {
    
    /// First connection point. The default for everything that doesn't have multiple connection points
    public var first: ConnectionPoint
    
    /// Second connection point. For example, the "output" part of an arithmetic combinator.
    public var second: ConnectionPoint?
    
    
    public init(first: ConnectionPoint, second: ConnectionPoint? = nil) {
        self.first = first
        self.second = second
    }
    
    
    enum CodingKeys: String, CodingKey {
        case first = "1"
        case second = "2"
    }
}


extension Connection: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Connection>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.first)
            descriptor.optional(for: \.second)
        }
    }
}
