//
//  ArithmeticCombinatorParameters.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct ArithmeticCombinatorParameters: Codable, Equatable {
    
    /// First signal to use in an operation. If not specified, the second argument will be the value of ``first_constant``.
    public var first_signal: SignalID?
    
    /// Which circuit networks (red/green) to read ``first_signal`` from.
    ///
    /// Defaults to `both`.
    public var first_signal_networks: CircuitNetworkSelection?
    
    /// Constant to use as the first argument of the operation. Has no effect when ``first_signal`` is set. Defaults to 0.
    public var first_constant: Int?
    
    /// When not specified,
    ///
    /// defaults to "*".
    public var operation: ArithmeticCombinatorParameterOperation?
    
    /// Second signal to use in an operation. If not specified, the second argument will be the value of ``second_constant``.
    public var second_signal: SignalID?
    
    /// Which circuit networks (red/green) to read ``second_signal`` from. Defaults to both.
    public var second_signal_networks: CircuitNetworkSelection?
    
    /// Constant to use as the second argument of the operation. Has no effect when ``second_signal`` is set.
    ///
    /// Defaults to 0.
    public var second_constant: Int?
    
    /// Specifies the signal to output.
    public var output_signal: SignalID?
    
    
    public init(first_signal: SignalID? = nil, first_signal_networks: CircuitNetworkSelection? = nil, first_constant: Int? = nil, operation: ArithmeticCombinatorParameterOperation? = nil, second_signal: SignalID? = nil, second_signal_networks: CircuitNetworkSelection? = nil, second_constant: Int? = nil, output_signal: SignalID) {
        self.first_signal = first_signal
        self.first_signal_networks = first_signal_networks
        self.first_constant = first_constant
        self.operation = operation
        self.second_signal = second_signal
        self.second_signal_networks = second_signal_networks
        self.second_constant = second_constant
        self.output_signal = output_signal
    }
}


extension ArithmeticCombinatorParameters: CustomStringConvertible {
    
    private func describe(_ signal: SignalID?, network: CircuitNetworkSelection?, constant: Int?) -> String {
        if let signal {
            return signal.description + " " + (network ?? CircuitNetworkSelection()).description
        } else {
            return (constant ?? 0).description
        }
    }
    
    public var description: String {
        var results = describe(first_signal, network: first_signal_networks, constant: first_constant)
        results += " " + (operation?.rawValue ?? "*").description
        results += " " + describe(second_signal, network: second_signal_networks, constant: second_constant)
        
        if let output_signal {
            results += " => " + output_signal.description
        }
        return results
    }
}
