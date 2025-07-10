//
//  DeciderCombinatorParameters.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct DeciderCombinatorParameters: Codable, Equatable {
    
    public var conditions: [Condition]
    
    public var outputs: [Output]
    
    
    public init(conditions: [Condition], outputs: [Output]) {
        self.conditions = conditions
        self.outputs = outputs
    }
    
    
    public struct Condition: Codable, CustomStringConvertible, Equatable {
        
        public var first_signal: SignalID?
        
        /// Which circuit networks (red/green) to read ``first_signal`` from. Defaults to both.
        public var first_signal_network: CircuitNetworkSelection?
        
        /// What to compare ``first_signal`` to. If not specified, ``first_signal`` will be compared to ``constant``.
        public var second_signal: SignalID?
        
        /// Which circuit networks (red/green) to read ``second_signal`` from. Defaults to both.
        public var second_signal_networks: CircuitNetworkSelection?
        
        /// Constant to compare ``first_signal`` to.
        ///
        /// Has no effect when ``second_signal`` is set. When neither ``second_signal`` nor ``constant`` are specified, the effect is as though constant were specified with the value 0.
        public var constant: Int?
        
        /// Specifies how the inputs should be compared.
        ///
        /// If not specified, defaults to "<".
        public var comparator: CircuitCondition.Comparator?
        
        /// Tells how this condition is compared with the preceding conditions in the corresponding conditions array.
        ///
        /// Defaults to "or".
        public var compareType: CompareType?
        
        
        public var description: String {
            var results = "<\(comparator?.rawValue ?? "or")>"
            results += (first_signal?.description ?? "<unknown>") + " " + (first_signal_network ?? CircuitNetworkSelection()).description
            results += " " + (comparator?.rawValue ?? "<") + " "
            if let second_signal {
                results += second_signal.description + " " + (first_signal_network ?? CircuitNetworkSelection()).description
            } else {
                results += (constant ?? 0).description
            }
            return results
        }
        
        
        public init(first_signal: SignalID? = nil, first_signal_network: CircuitNetworkSelection? = nil, second_signal: SignalID? = nil, second_signal_networks: CircuitNetworkSelection? = nil, constant: Int? = nil, comparator: CircuitCondition.Comparator? = nil, compareType: CompareType? = nil) {
            self.first_signal = first_signal
            self.first_signal_network = first_signal_network
            self.second_signal = second_signal
            self.second_signal_networks = second_signal_networks
            self.constant = constant
            self.comparator = comparator
            self.compareType = compareType
        }
        
        
        public enum CompareType: String, Codable, Equatable {
            case and, or
        }
        
    }
    
    
    public struct Output: Codable, CustomStringConvertible, Equatable {
        
        /// Specifies a signal to output.
        public var signal: SignalID
        
        /// Defaults to `true`. When false, will output a value of `1` for the given `output_signal`.
        public var copy_count_from_input: Bool?
        
        /// Sets which input network to read the value of signal from if ``copy_count_from_input`` is true.
        ///
        /// Defaults to `both`.
        public var networks: CircuitNetworkSelection?
        
        
        public var description: String {
            self.signal.description + " \(copy_count_from_input ?? true ? "copy" : "1") " + (networks ?? CircuitNetworkSelection()).description
        }
        
        
        public init(signal: SignalID, copy_count_from_input: Bool? = nil, networks: CircuitNetworkSelection? = nil) {
            self.signal = signal
            self.copy_count_from_input = copy_count_from_input
            self.networks = networks
        }
    }
    
}


extension DeciderCombinatorParameters: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<DeciderCombinatorParameters>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.sequence(for: \.conditions)
            descriptor.sequence(for: \.outputs)
        }
    }
}
