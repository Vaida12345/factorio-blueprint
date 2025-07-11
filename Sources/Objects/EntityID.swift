//
//  EntityID.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


/// A reference to an ``Entity``.
///
/// This is the unique ID of this entity in a local space. A blueprint string uses `EntityID` to refer to an entity. You can use `resolve` to retrieve an entity.
///
/// ```swift
/// let blueprint = try Blueprint.parse(string)
/// detailedPrint(blueprint)
/// detailedPrint(blueprint.resolve(blueprint.wires!.first!.source))
/// ```
public struct EntityID: Identifiable, Codable, RawRepresentable, Sendable, CustomStringConvertible, Equatable, ExpressibleByIntegerLiteral {
    
    public var id: Int {
        self.rawValue
    }
    
    public var rawValue: Int
    
    
    public var description: String {
        "Entity #\(id)"
    }
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(Int.self)
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(rawValue: value)
    }
    
}
