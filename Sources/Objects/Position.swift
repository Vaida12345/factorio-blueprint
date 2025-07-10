//
//  Position.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct Position: Codable, CustomStringConvertible, Equatable {
    
    public var x: Double
    
    public var y: Double
    
    
    public var description: String {
        "(\(x), \(y))"
    }
    
}
