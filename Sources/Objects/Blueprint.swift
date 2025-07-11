//
//  Blueprint.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import Foundation
import Essentials
import DetailedDescription


///
///
/// - SeeAlso: [wiki](https://wiki.factorio.com/Blueprint_string_format#Entity_object)
public final class Blueprint: Codable, Equatable {
    
    /// the name of the item that was saved ("blueprint" in vanilla).
    public var item: String
    
    /// The name of the blueprint set by the user.
    public var label: String?
    
    /// The color of the label of this blueprint
    public var labelColor: Color?
    
    /// The actual content of the blueprint
    public var entities: [Entity]
    
    /// The tiles included in the blueprint,
    public var tiles: [Tile]?
    
    /// The icons of the blueprint set by the user
    public var icons: [Icon]
    
    /// The schedules for trains in this blueprint
    public var schedules: [Schedules]?
    
    /// The description of the blueprint
    public var description: String?
    
    /// The dimensions of the grid to use for snapping
    public var snapToGrid: Position?
    
    /// Whether the blueprint uses absolute or relative snapping.
    public var absoluteSnapping: Bool?
    
    /// Offset relative to the global absolute snapping grid
    public var positionRelativeToGrid: Position?
    
    /// The map version of the map the blueprint was created in.
    public var version: Version
    
    /// The parameters of the blueprint, for generic blueprints.
    public var parameters: [Parameter]?
    
    /// Wires in this blueprint
    public var wires: [Wire]?
    
    
    public static func == (_ lhs: Blueprint, _ rhs: Blueprint) -> Bool {
        lhs.item == rhs.item
        && lhs.label == rhs.label
        && lhs.labelColor == rhs.labelColor
        && lhs.entities == rhs.entities
        && lhs.tiles == rhs.tiles
        && lhs.icons == rhs.icons
        && lhs.schedules == rhs.schedules
        && lhs.description == rhs.description
        && lhs.snapToGrid == rhs.snapToGrid
        && lhs.absoluteSnapping == rhs.absoluteSnapping
        && lhs.positionRelativeToGrid == rhs.positionRelativeToGrid
        && lhs.version == rhs.version
        && lhs.parameters == rhs.parameters
        && lhs.wires == rhs.wires
    }
    
    
    enum CodingKeys: String, CodingKey {
        case item
        case label
        case labelColor = "label_color"
        case entities
        case tiles
        case icons
        case schedules
        case description
        case snapToGrid = "snap-to-grid"
        case absoluteSnapping = "absolute-snapping"
        case positionRelativeToGrid = "position-relative-to-grid"
        case version
        case parameters
        case wires
    }
    
}

extension Blueprint {
    
    /// Parse a blueprint String.
    public static func parse(_ blueprintString: String) throws -> Blueprint {
        guard let data = try BlueprintStringParser.parse(blueprintString).blueprint else {
            throw ParserError.notBlueprint
        }
        return data
    }
    
    public func makeBlueprintString() throws -> String {
        try BlueprintStringParser(blueprint: self).makeBlueprintString()
    }
}


extension Blueprint: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Blueprint>) -> any DescriptionBlockProtocol {
        descriptor.container(self.label ?? "Blueprint") {
            descriptor.optional(for: \.labelColor)
            descriptor.sequence(for: \.entities)
            descriptor.optional(for: \.description)
            descriptor.sequence(for: \.icons)
            descriptor.optional(for: \.tiles)
            descriptor.optional(for: \.schedules)
            descriptor.optional(for: \.snapToGrid)
            descriptor.optional(for: \.absoluteSnapping)
            descriptor.optional(for: \.positionRelativeToGrid)
            descriptor.value(for: \.version)
            descriptor.optional(for: \.parameters)
            descriptor.optional(for: \.wires)
        }
    }
}


extension Blueprint {
    
    /// Resolves the id in the blueprint.
    public func resolve(_ id: EntityID) -> Entity? {
        entities.first { $0.id == id }
    }
}
