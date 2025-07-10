//
//  ItemFilter.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct ItemFilter: Codable, CustomStringConvertible, Equatable {
    
    /// Name of the item prototype this filter is set to
    public var target: String
    
    /// Index of the filter, 1-based.
    public var id: Int
    
    
    public var description: String {
        "ItemFilter<#\(self.id)>(target: \(self.target))"
    }
    
    
    public init(target: String, id: Int) {
        self.target = target
        self.id = id
    }
    
    
    enum CodingKeys: String, CodingKey {
        case target = "name"
        case id = "index"
    }
    
    
    public enum Mode: String, Codable {
        case whitelist, blacklist
    }
    
}
