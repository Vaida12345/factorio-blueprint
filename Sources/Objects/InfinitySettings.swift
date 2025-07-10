//
//  InfinitySettings.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct InfinitySettings: Codable, Equatable {
    
    public var removeUnfilteredItems: Bool
    
    /// Filters of the infinity container
    public var filters: [Filter]?
    
    
    public init(removeUnfilteredItems: Bool, filters: [Filter]? = nil) {
        self.removeUnfilteredItems = removeUnfilteredItems
        self.filters = filters
    }
    
    
    enum CodingKeys: String, CodingKey {
        case removeUnfilteredItems = "remove_unfiltered_items"
        case filters
    }
    
    
    public struct Filter: Codable, CustomStringConvertible, Equatable {
        
        /// Name of the item prototype the filter is set to, string.
        public var name: String
        
        /// Number the filter is set to
        public var count: Int
        
        /// Mode of the filter
        public var mode: Mode
        
        /// Index of the filter, 1-based.
        public var id: Int
        
        
        public var description: String {
            "\(self.name) \(self.mode) \(self.mode)"
        }
        
        
        public init(name: String, count: Int, mode: Mode, id: Int) {
            self.name = name
            self.count = count
            self.mode = mode
            self.id = id
        }
        
        
        public enum Mode: String, Codable, CustomStringConvertible {
            case atLeast = "at-least"
            case atMost = "at-most"
            case exactly = "exactly"
            
            public var description: String {
                switch self {
                case .atLeast:
                    "≥"
                case .atMost:
                    "≤"
                case .exactly:
                    "="
                }
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case name
            case count
            case mode
            case id = "index"
        }
        
    }
}


extension InfinitySettings: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<InfinitySettings>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.removeUnfilteredItems)
            descriptor.optional(for: \.filters)
        }
    }
}
