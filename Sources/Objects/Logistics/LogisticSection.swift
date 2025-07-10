//
//  LogisticSection.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct LogisticSection: Codable, Equatable {
    
    public var id: Int
    
    public var filters: [BlueprintLogisticFilter]?
    
    public var group: String?
    
    public var multiplier: Double?
    
    public var active: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "index"
        case filters
        case group
        case multiplier
        case active
    }
    
    
    public init(id: Int, filters: [BlueprintLogisticFilter]? = nil, group: String? = nil, multiplier: Double? = nil, active: Bool? = nil) {
        self.id = id
        self.filters = filters
        self.group = group
        self.multiplier = multiplier
        self.active = active
    }
    
}


extension LogisticSection: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<LogisticSection>) -> any DescriptionBlockProtocol {
        descriptor.container("LogisticSection #\(self.id)") {
            descriptor.optional(for: \.filters)
            descriptor.optional(for: \.group)
            descriptor.optional(for: \.multiplier)
            descriptor.optional(for: \.active)
        }
    }
}
