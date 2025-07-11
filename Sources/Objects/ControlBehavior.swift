//
//  ControlBehavior.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct ControlBehavior: Codable, Equatable {
    
    public var logistic_condition: CircuitCondition?
    
    /// Whether this entity is connected to the logistic network and enables/disables based on ``logistic_condition``.
    public var connect_to_logistic_network: Bool?
    
    /// Whether this rail signal can be closed by circuit_condition.
    public var circuit_close_signal: Bool?
    
    /// Whether or not to read the state of this rail/chain signal.
    public var circuit_read_signal: Bool?
    
    /// Signal use if the rail/chain signal is currently red.
    public var red_output_signal: SignalID?
    
    /// Signal use if the rail/chain signal is currently orange.
    public var orange_output_signal: SignalID?
    
    /// Signal use if the rail/chain signal is currently green.
    public var green_output_signal: SignalID?
    
    /// Signal use if the rail/chain signal is currently blue.
    public var blue_output_signal: SignalID?
    
    public var circuit_condition: CircuitCondition?
    
    /// Enable or disable based on ``circuit_condition``.
    public var circuit_enable_disable: Bool?
    
    /// Send circuit values to the train to use in schedule conditions.
    public var send_to_train: Bool?
    
    /// Get the currently stopped trains cargo.
    public var read_from_train: Bool?
    
    /// Get the currently stopped trains ID.
    public var read_stopped_train: Bool?
    
    /// Signal to output the train ID on.
    public var train_stopped_signal: SignalID?
    
    /// Whether this stations trains limit will be set through circuit values.
    public var set_trains_limit: Bool?
    
    /// Signal to use to set the trains limit.
    public var trains_limit_signal: SignalID?
    
    /// Whether to read this stations currently on route trains count.
    public var read_trains_count: Bool?
    
    /// Signal to output the on route trains count on.
    public var trains_count_signal: SignalID?
    
    /// Whether this roboport should output the contents of its network.
    public var read_logistics: Bool?
    
    /// Whether this roboport should output the robot stats of its network.
    public var read_robot_stats: Bool?
    
    /// Signal to output available logistic robots on.
    public var available_logistic_output_signal: SignalID?
    
    /// Signal to output the total count of logistic robots on.
    public var total_logistic_output_signal: SignalID?
    
    /// Signal to output available construction robots on.
    public var available_construction_output_signal: SignalID?
    
    /// Signal to output the total count of construction robots on.
    public var total_construction_output_signal: SignalID?
    
    /// Whether to limit the gate opening with ``circuit_condition``.
    public var circuit_open_gate: Bool?
    
    /// Whether to send the wall-gate proximity sensor to the circuit network.
    public var circuit_read_sensor: Bool?
    
    /// Signal to output the wall-gate sensor / accumulator charge on.
    public var output_signal: SignalID?
    
    /// Whether to read this belts content or inserters hand.
    public var circuit_read_hand_contents: Bool?
    
    public var circuit_contents_read_mode: TransportBelt.ContentReadMode?
    
    public var circuit_hand_read_mode: Inserter.HandReadMode?
    
    /// Whether to set the inserters stack size from a circuit signal.
    public var circuit_set_stack_size: Bool?
    
    /// Signal to use to set the inserters stack size.
    public var stack_control_input_signal: SignalID?
    
    /// Whether this miner should output its remaining resource amounts to the circuit network.
    public var circuit_read_resources: Bool?
    
    public var circuit_resource_read_mode: MiningDrill.ResourceReadMode?
    
    /// Whether this constant combinator is currently on or off.
    public var isOn: Bool?
    
    public var filters: LogisticSections?
    
    public var arithmetic_conditions: ArithmeticCombinatorParameters?
    
    public var decider_conditions: DeciderCombinatorParameters?
    
    public var circuit_parameters: ProgrammableSpeaker.CircuitParameters?
    
    /// Whether this lamp should use colors or not.
    public var use_colors: Bool?
    
    public var circuit_set_filters: Bool?
    
    public var ignore_unlisted_targets_condition: CircuitCondition?
    
    public var set_ignore_unlisted_targets: Bool?
    
    public var circuit_enabled: Bool?
    
    public var index_constant: Int?
    
    public var select_max: Bool?
    
    public var operation: SelectorCombinator.Operation?
    
    
    public init() {
        
    }
    
    
    public struct TransportBelt {
        public enum ContentReadMode: Int, Codable, Equatable {
            case pulse
            case hold
            case entireBelt
        }
    }
    
    public struct Inserter {
        public enum HandReadMode: Int, Codable, Equatable {
            case pulse
            case hold
        }
    }
    
    public struct MiningDrill {
        public enum ResourceReadMode: Int, Codable, Equatable {
            case this_miner
            case entire_patch
        }
    }
    
    public struct SelectorCombinator {
        public enum Operation: String, Codable, Equatable {
            case selectInput = "select"
            case random
            case count
            case rocketCapacity = "rocket-capacity"
            case stackSize = "stack-size"
            case qualityTransfer = "quality-transfer"
            case qualityFilter = "quality-filter"
        }
    }
}


extension ControlBehavior: DetailedStringConvertible {
    
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<ControlBehavior>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.optional(for: \.logistic_condition)
            descriptor.optional(for: \.connect_to_logistic_network)
            descriptor.optional(for: \.circuit_close_signal)
            descriptor.optional(for: \.circuit_read_signal)
            descriptor.optional(for: \.red_output_signal)
            descriptor.optional(for: \.orange_output_signal)
            descriptor.optional(for: \.green_output_signal)
            descriptor.optional(for: \.blue_output_signal)
            descriptor.optional(for: \.circuit_condition)
            descriptor.optional(for: \.circuit_enable_disable)
            descriptor.optional(for: \.send_to_train)
            descriptor.optional(for: \.read_from_train)
            descriptor.optional(for: \.read_stopped_train)
            descriptor.optional(for: \.train_stopped_signal)
            descriptor.optional(for: \.set_trains_limit)
            descriptor.optional(for: \.trains_limit_signal)
            descriptor.optional(for: \.read_robot_stats)
            descriptor.optional(for: \.available_logistic_output_signal)
            descriptor.optional(for: \.total_logistic_output_signal)
            descriptor.optional(for: \.available_construction_output_signal)
            descriptor.optional(for: \.total_construction_output_signal)
            descriptor.optional(for: \.circuit_open_gate)
            descriptor.optional(for: \.circuit_read_sensor)
            descriptor.optional(for: \.circuit_read_hand_contents)
            descriptor.optional(for: \.circuit_contents_read_mode)
            descriptor.optional(for: \.circuit_hand_read_mode)
            descriptor.optional(for: \.circuit_set_stack_size)
            descriptor.optional(for: \.stack_control_input_signal)
            descriptor.optional(for: \.circuit_read_resources)
            descriptor.optional(for: \.circuit_resource_read_mode)
            descriptor.optional(for: \.isOn)
            descriptor.optional(for: \.filters)
            descriptor.optional(for: \.arithmetic_conditions)
            descriptor.optional(for: \.decider_conditions)
            descriptor.optional(for: \.circuit_parameters)
            descriptor.optional(for: \.use_colors)
            descriptor.optional(for: \.circuit_set_filters)
            descriptor.optional(for: \.ignore_unlisted_targets_condition)
            descriptor.optional(for: \.set_ignore_unlisted_targets)
            descriptor.optional(for: \.circuit_enabled)
            descriptor.optional(for: \.index_constant)
            descriptor.optional(for: \.select_max)
            descriptor.optional(for: \.operation)
        }
    }
}
