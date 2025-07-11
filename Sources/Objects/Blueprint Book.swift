//
//  Blueprint Book.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import Essentials
import DetailedDescription

/// A blueprint book.
public final class BlueprintBook: Codable, Equatable {
    
    /// String, the name of the item that was saved ("blueprint-book" in vanilla).
    ///
    /// Note that the key within the wrapping object is `"blueprint_book"` (with an underscore).
    public var item: String
    
    /// the name of the blueprint set by the user.
    public var label: String?
    
    /// The color of the label of this blueprint
    public var labelColor: Color?
    
    /// The actual content of the blueprint book
    public var blueprints: [Element]
    
    /// Index of the currently selected blueprint, 0-based.
    public var activeIndex: Int
    
    /// The icons of the blueprint book set by the user
    public var icons: [Icon]
    
    /// The description of the blueprint book.
    public var description: String?
    
    /// The map version of the map the blueprint was created.
    public var version: Version
    
    
    public static func == (_ lhs: BlueprintBook, _ rhs: BlueprintBook) -> Bool {
        lhs.item == rhs.item &&
        lhs.label == rhs.label &&
        lhs.labelColor == rhs.labelColor &&
        lhs.blueprints == rhs.blueprints &&
        lhs.activeIndex == rhs.activeIndex &&
        lhs.icons == rhs.icons &&
        lhs.description == rhs.description &&
        lhs.version == rhs.version
    }
    
    
    public struct Element: Codable, Equatable {
        
        public var index: String
        
        public var blueprint: Blueprint
        
    }
    
}


extension BlueprintBook {
    
    /// Parse a blueprint String.
    public static func parse(_ blueprintString: String) throws -> BlueprintBook {
        guard let data = try BlueprintStringParser.parse(blueprintString).blueprint_book else {
            throw ParserError.notBlueprintBook
        }
        return data
    }
    
    public func makeBlueprintString() throws -> String {
        try BlueprintStringParser(blueprint_book: self).makeBlueprintString()
    }
}


extension BlueprintBook: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<BlueprintBook>) -> any DescriptionBlockProtocol {
        descriptor.container(self.label ?? "Blueprint Book") {
            descriptor.optional(for: \.labelColor)
            descriptor.sequence(for: \.blueprints)
            descriptor.value(for: \.activeIndex)
            descriptor.sequence(for: \.icons)
            descriptor.optional(for: \.description)
            descriptor.value(for: \.version)
        }
    }
}


extension BlueprintBook {
    
    /// Resolves the id in the book.
    public func resolve(_ id: EntityID) -> Entity? {
        for blueprint in self.blueprints {
            if let entity = blueprint.blueprint.resolve(id) {
                return entity
            }
        }
        return nil
    }
}
