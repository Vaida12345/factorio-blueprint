//
//  Entity.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public final class Entity: Codable, Equatable {
    
    /// Index of the entity, 1-based.
    public let id: EntityID
    
    /// Prototype name of the entity (e.g. "offshore-pump").
    public var name: String
    
    /// Position of the entity within the blueprint.
    public var position: Position
    
    /// Direction of the entity
    ///
    /// - Note: If not specified, it is facing ``Direction/north``.
    public var direction: Direction?
    
    /// Orientation of cargo wagon or locomotive
    ///
    /// It has 8 directions, dividing a circle evenly clockwise in `[0, 1]`.
    public var orientation: Double?
    
    /// Circuit connections.
    public var connections: Connection?
    
    /// Copper wire connections
    public var neighbors: [EntityID]?
    
    /// Control behavior of this entity (optional).
    public var control_behavior: ControlBehavior?
    
    /// Item requests by this entity, this is what defines the item-request-proxy when the blueprint is placed
    ///
    /// Key is the name of the item, string. Value is the amount of items to be requested
    public var items: [Item]?
    
    /// Name of the recipe prototype this assembling machine is set to
    public var recipe: String?
    
    /// The index of the first inaccessible item slot due to limiting with the red "bar". 0-based
    public var bar: Int?
    
    /// Ammo inventory of an entity (e.g. Spidertron)
    public var ammo_inventory: Inventory?
    
    /// Boot/Luggage inventory of an entity (e.g. storage inventory of a Spidertron)
    public var trunk_inventory: Inventory?
    
    /// Cargo wagon inventory configuration
    public var inventory: Inventory?
    
    /// Used by infinity container.
    public var infinity_settings: InfinitySettings?
    
    /// Type of the underground belt or loader
    public var type: `Type`?
    
    /// Input priority of the splitter
    public var input_priority: Priority?
    
    /// Output priority of the splitter
    public var output_priority: Priority?
    
    /// Filter of the splitter.
    ///
    /// Name of the item prototype the filter is set to.
    public var filter: Filter?
    
    /// Filters of the filter inserter or loader
    public var filters: [ItemFilter]?
    
    /// Filter mode of the filter inserter,
    public var filter_mode: ItemFilter.Mode?
    
    /// The stack size the inserter is set to
    public var override_stack_size: Int?
    
    /// The drop position the inserter is set to
    public var drop_position: Position?
    
    /// The pickup position the inserter is set to
    public var pickup_position: Position?
    
    public var request_filters: RequestFilters?
    
    /// Used by Programmable speaker
    public var parameters: ProgrammableSpeaker.Parameters?
    
    /// Used by Programmable speaker
    public var alert_parameters: ProgrammableSpeaker.AlertParameter?
    
    /// Whether auto launch is enabled.
    ///
    /// Used by the rocket silo.
    public var auto_launch: Bool?
    
    /// Used by Prototype/SimpleEntityWithForce or Prototype/SimpleEntityWithOwner
    public var variation: Int?
    
    /// Color of the Prototype/SimpleEntityWithForce, Prototype/SimpleEntityWithOwner, or train station
    public var color: Color?
    
    /// The name of the train station
    public var station: String?
    
    /// The manually set train limit of the train station, optional.
    public var manual_trains_limit: String?
    
    /// The current state of the power switch
    public var switch_state: Bool?
    
    public var request_missing_construction_materials: Bool?
    
    public var use_filters: Bool?
    
    
    public static func == (_ lhs: Entity, _ rhs: Entity) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.position == rhs.position &&
        lhs.direction == rhs.direction &&
        lhs.orientation == rhs.orientation &&
        lhs.connections == rhs.connections &&
        lhs.neighbors == rhs.neighbors &&
        lhs.control_behavior == rhs.control_behavior &&
        lhs.items == rhs.items &&
        lhs.recipe == rhs.recipe &&
        lhs.bar == rhs.bar &&
        lhs.ammo_inventory == rhs.ammo_inventory &&
        lhs.trunk_inventory == rhs.trunk_inventory &&
        lhs.infinity_settings == rhs.infinity_settings &&
        lhs.type == rhs.type &&
        lhs.input_priority == rhs.input_priority &&
        lhs.output_priority == rhs.output_priority &&
        lhs.filter == rhs.filter &&
        lhs.filters == rhs.filters &&
        lhs.filter_mode == rhs.filter_mode &&
        lhs.override_stack_size == rhs.override_stack_size &&
        lhs.drop_position == rhs.drop_position &&
        lhs.pickup_position == rhs.pickup_position &&
        lhs.request_filters == rhs.request_filters &&
        lhs.parameters == rhs.parameters &&
        lhs.alert_parameters == rhs.alert_parameters &&
        lhs.auto_launch == rhs.auto_launch &&
        lhs.variation == rhs.variation &&
        lhs.color == rhs.color &&
        lhs.station == rhs.station &&
        lhs.manual_trains_limit == rhs.manual_trains_limit &&
        lhs.switch_state == rhs.switch_state &&
        lhs.request_missing_construction_materials == rhs.request_missing_construction_materials &&
        lhs.use_filters == rhs.use_filters
    }
    
    
    init(id: EntityID, name: String, position: Position) {
        self.id = id
        self.name = name
        self.position = position
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "entity_number"
        case name
        case position
        case direction
        case orientation
        case connections
        case neighbors = "neighbours"
        case control_behavior
        case items
        case recipe
        case bar
        case ammo_inventory
        case trunk_inventory
        case inventory
        case infinity_settings
        case type
        case input_priority
        case output_priority
        case filter
        case filters
        case filter_mode
        case override_stack_size
        case drop_position
        case pickup_position
        case request_filters
        case parameters
        case alert_parameters
        case auto_launch
        case variation
        case color
        case station
        case manual_trains_limit
        case switch_state
        case request_missing_construction_materials
        case use_filters
    }
    
    
    public enum `Type`: String, Codable, Equatable {
        case input, output
    }
    
    public enum Priority: String, Codable, Equatable {
        case left, right
    }
    
    public struct Filter: Codable, Equatable {
        public var comparator: CircuitCondition.Comparator
        public var name: String
        public var quality: Quality
    }
    
    public struct Item: Codable, Equatable {
        public var id: SignalID
        public var items: Item
        
        public struct Item: Codable, Equatable {
            public var in_inventory: [Container]
            
            
            public struct Container: Codable, Equatable {
                public var inventory: Int
                public var stack: Int
            }
        }
    }
    
}


extension Entity: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Entity>) -> any DescriptionBlockProtocol {
        descriptor.container(self.name + " | " + self.position.description) {
            descriptor.optional(for: \.direction)
            descriptor.optional(for: \.orientation)
            descriptor.optional(for: \.connections)
            descriptor.optional(for: \.neighbors)
            descriptor.optional(for: \.control_behavior)
            descriptor.optional(for: \.items)
            descriptor.optional(for: \.recipe)
            descriptor.optional(for: \.bar)
            descriptor.optional(for: \.ammo_inventory)
            descriptor.optional(for: \.trunk_inventory)
            descriptor.optional(for: \.inventory)
            descriptor.optional(for: \.infinity_settings)
            descriptor.optional(for: \.type)
            descriptor.optional(for: \.input_priority)
            descriptor.optional(for: \.output_priority)
            descriptor.optional(for: \.filter)
            descriptor.optional(for: \.filters)
            descriptor.optional(for: \.filter_mode)
            descriptor.optional(for: \.override_stack_size)
            descriptor.optional(for: \.drop_position)
            descriptor.optional(for: \.pickup_position)
            descriptor.optional(for: \.request_filters)
            descriptor.optional(for: \.auto_launch)
            descriptor.optional(for: \.variation)
            descriptor.optional(for: \.color)
            descriptor.optional(for: \.station)
            descriptor.optional(for: \.manual_trains_limit)
            descriptor.optional(for: \.switch_state)
            descriptor.optional(for: \.request_missing_construction_materials)
            descriptor.optional(for: \.use_filters)
        }
    }
    
}


extension Entity.Filter: CustomStringConvertible {
    
    public var description: String {
        self.comparator.rawValue + " " + self.name + " (\(self.quality.rawValue))"
    }
}


extension Entity.Item: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Entity.Item>) -> any DescriptionBlockProtocol {
        descriptor.container(self.id.description) {
            descriptor.value(for: \.items)
        }
    }
}


extension Entity.Item.Item: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Entity.Item.Item>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.in_inventory)
        }
    }
}


extension Entity.Item.Item.Container: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Entity.Item.Item.Container>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.inventory)
            descriptor.value(for: \.stack)
        }
    }
}
