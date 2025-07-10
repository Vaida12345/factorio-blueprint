//
//  Inventory.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct Inventory: Codable, Equatable {
    
    public var filters: [ItemFilter]
    
    /// The index of the first inaccessible item slot due to limiting with the red "bar". 0-based
    public var bar: Int?
    
    
    public init(filters: [ItemFilter], bar: Int? = nil) {
        self.filters = filters
        self.bar = bar
    }
}


extension Inventory: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Inventory>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.sequence(for: \.filters)
            descriptor.optional(for: \.bar)
        }
    }
}
