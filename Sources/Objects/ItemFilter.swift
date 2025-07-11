//
//  ItemFilter.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct ItemFilter: Codable, CustomStringConvertible, Equatable {
    
    /// Name of the item prototype this filter is set to
    public var target: String
    
    public var quality: Quality
    
    public var comparator: CircuitCondition.Comparator
    
    /// Index of the filter, 1-based.
    public var id: Int
    
    
    public var description: String {
        "\(comparator.rawValue) \(self.target) (\(self.quality))"
    }
    
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case target = "name"
        case id = "index"
        case quality
        case comparator
    }
    
    
    public enum Mode: String, Codable {
        case whitelist, blacklist
    }
    
}
