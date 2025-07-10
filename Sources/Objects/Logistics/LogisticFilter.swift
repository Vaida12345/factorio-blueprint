//
//  LogisticFilter.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct LogisticFilter: Codable, Equatable {
    
    /// Name of the item prototype this filter is set to.
    public var target: String
    
    /// Index of the filter, 1-based.
    public var id: Int
    
    /// Number the filter is set to
    ///
    /// 0 for storage chests.
    public var count: Int
    
    
    enum CodingKeys: String, CodingKey, Equatable {
        case target = "name"
        case id = "index"
        case count
    }
    
    
    public init(target: String, id: Int, count: Int) {
        self.target = target
        self.id = id
        self.count = count
    }
}


extension LogisticFilter: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<LogisticFilter>) -> any DescriptionBlockProtocol {
        descriptor.container("LogisticFilter #\(self.id)") {
            descriptor.value(for: \.target)
            descriptor.value(for: \.count)
        }
    }
}
