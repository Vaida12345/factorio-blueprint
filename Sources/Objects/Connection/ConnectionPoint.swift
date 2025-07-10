//
//  ConnectionPoint.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


/// The actual point where a wire is connected to.
///
/// This contains information about where it is connected to.
public struct ConnectionPoint: Codable, Sendable, Equatable {
    
    /// Contains all the connections from this point created by red wire.
    public var red: [ConnectionData]
    
    /// Contains all the connections from this point created by green wire.
    public var green: [ConnectionData]
    
    
    public init(red: [ConnectionData], green: [ConnectionData]) {
        self.red = red
        self.green = green
    }
}


extension ConnectionPoint: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<ConnectionPoint>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.sequence(for: \.red)
            descriptor.sequence(for: \.green)
        }
        .hideEmptySequence()
    }
}
