//
//  BlueprintWire.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-11.
//


extension Blueprint {
    
    public struct Wire: Equatable, Codable {
        
        public var source: EntityID
        
        public var sourceConnector: WireConnector
        
        public var destination: EntityID
        
        public var destinationConnector: WireConnector
        
        
        public enum WireConnector: Int, Equatable, Codable {
            /// Also indicates `combinator_input_green`
            case circuit_green = 2
            /// Also indicates `combinator_input_red`
            case circuit_red = 1
            case combinator_output_green = 4
            case combinator_output_red = 3
            /// Also indicates `power_switch_left_copper`
            case pole_copper = 5
            case power_switch_right_copper = 6
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let array = try container.decode([Int].self)
            guard array.count == 4 else { throw ParserError.invalidWireArrayLength(array.count) }
            
            self.source = EntityID(rawValue: array[0])
            self.sourceConnector = WireConnector(rawValue: array[1])!
            self.destination = EntityID(rawValue: array[2])
            self.destinationConnector = WireConnector(rawValue: array[3])!
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode([self.source.rawValue, self.sourceConnector.rawValue, self.destination.rawValue, self.destinationConnector.rawValue])
        }
    }
    
}


extension Blueprint.Wire.WireConnector {
    
    fileprivate var description: String {
        switch self {
        case .circuit_green: "green"
        case .circuit_red: "red"
        case .combinator_output_red: "red output"
        case .combinator_output_green: "green output"
        case .pole_copper: "copper"
        case .power_switch_right_copper: "copper right"
        }
    }
}


extension Blueprint.Wire: CustomStringConvertible {
    
    public var description: String {
        "\(self.source) (\(self.sourceConnector.description)) -> \(self.destination) (\(self.destinationConnector.description))"
    }
    
}
