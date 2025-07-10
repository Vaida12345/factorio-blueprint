//
//  Schedule.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct Schedules: Codable, Equatable {
    
    public var schedule: Schedule
    
    /// Array of entity numbers of locomotives using this schedule.
    public var locomotives: [EntityID]
    
    
    public init(schedule: Schedule, locomotives: [EntityID]) {
        self.schedule = schedule
        self.locomotives = locomotives
    }
    
    
    public struct Schedule: Codable, Equatable {
        
        public var interrupts: [Interrupt]
        
        public var records: [Record]

        
        public struct Record: Codable, Equatable {
            
            /// The name of the stop for this schedule record.
            public var station: String
            
            public var wait_conditions: [Condition]?
            
            /// Whether this is a temporary schedule record.
            public var temporary: Bool?
            
            
            public init(station: String, wait_conditions: [Condition], temporary: Bool? = nil) {
                self.station = station
                self.wait_conditions = wait_conditions
                self.temporary = temporary
            }
            
        }
        
        public struct Condition: Codable, Equatable {
            
            public var type: `Type`
            
            /// Tells how this condition is to be compared with the preceding conditions in the corresponding wait_conditions array.
            public var compareType: CompareType?
            
            /// Number of ticks to wait or of inactivity. Only present when type is "time" or "inactivity".
            public var ticks: Int?
            
            /// only present when type is "item_count", "circuit" or "fluid_count".
            public var condition: CircuitCondition?
            
            
            public init(type: Type, compareType: CompareType, ticks: Int? = nil, condition: CircuitCondition? = nil) {
                self.type = type
                self.compareType = compareType
                self.ticks = ticks
                self.condition = condition
            }
            
            
            public enum `Type`: String, Codable, Equatable {
                case time
                case inactivity
                case full
                case empty
                case item_count
                case circuit
                case robots_inactive
                case fluid_count
                case passenger_present
                case passenger_not_present
            }
            
            public enum CompareType: String, Codable, Equatable {
                case and, or
            }
        }
        
        
        public struct Interrupt: Codable, Equatable {
            
            public let conditions: [Condition]
            
            public let inside_interrupt: Bool
            
            public let name: String
            
            public let targets: [Record]
            
        }
        
    }
    
}


extension Schedules: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Schedules>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.schedule)
            descriptor.sequence(for: \.locomotives)
        }
    }
}


extension Schedules.Schedule: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Schedules.Schedule>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.sequence(for: \.interrupts)
            descriptor.sequence(for: \.records)
        }
    }
}


extension Schedules.Schedule.Interrupt: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Schedules.Schedule.Interrupt>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.name)
            descriptor.sequence(for: \.conditions)
            descriptor.value(for: \.inside_interrupt)
            descriptor.sequence(for: \.targets)
        }
    }
}


extension Schedules.Schedule.Record: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Schedules.Schedule.Record>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.station)
            descriptor.optional(for: \.wait_conditions)
            descriptor.optional(for: \.temporary)
        }
    }
}


extension Schedules.Schedule.Condition: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<Schedules.Schedule.Condition>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.type)
            descriptor.optional(for: \.compareType)
            descriptor.optional(for: \.ticks)
            descriptor.optional(for: \.condition)
        }
    }
}
