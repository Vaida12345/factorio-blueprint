//
//  LogisticSections.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct LogisticSections: Codable, Equatable {
    
    public var sections: [LogisticSection]?
    
    public var trash_not_requested: Bool?
    
    public init(sections: [LogisticSection]? = nil, trash_not_requested: Bool? = nil) {
        self.sections = sections
        self.trash_not_requested = trash_not_requested
    }
}


extension LogisticSections: DetailedStringConvertible {
    
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<LogisticSections>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.optional(for: \.sections)
            descriptor.optional(for: \.trash_not_requested)
        }
    }
}
