//
//  Tile.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct Tile: Codable, Equatable {
    
    /// Prototype name of the tile (e.g. "concrete")
    public var name: String
    
    /// Position of the entity within the blueprint
    public var position: Position
    
    
    public init(name: String, position: Position) {
        self.name = name
        self.position = position
    }
    
}


extension Tile: CustomStringConvertible {
    
    public var description: String {
        self.name + " | " + self.position.description
    }
    
}
