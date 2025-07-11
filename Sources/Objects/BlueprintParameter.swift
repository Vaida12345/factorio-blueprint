//
//  Blueprint + Parameter.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-11.
//

import DetailedDescription


extension Blueprint {
    
    public struct Parameter: Equatable, Codable {
        /// An entity name, when `type` is `id`/
        public var id: String?
        
        /// The name of the parameter
        public var name: String
        
        public var parameter: Bool?
        
        /// The value type.
        public var type: `Type`
        
        public var not_parameterized: Bool?
        
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case parameter
            case type
            case not_parameterized = "not-parametrised"
        }
        
        
        public enum `Type`: String, Codable {
            case id, number
        }
    }
    
}


extension Blueprint.Parameter: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Blueprint.Parameter>) -> any DescriptionBlockProtocol {
        descriptor.container(self.name) {
            descriptor.value(for: \.type)
            descriptor.optional(for: \.id)
            descriptor.optional(for: \.parameter)
            descriptor.optional(for: \.not_parameterized)
        }
    }
}
