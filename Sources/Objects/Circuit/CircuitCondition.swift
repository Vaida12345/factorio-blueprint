//
//  CircuitCondition.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct CircuitCondition: Codable, Equatable {
    
    /// Specifies how the inputs should be compared. If not specified, defaults to `"<"`.
    public var comparator: Comparator?
    
    /// Defaults to blank.
    public var firstSignal: SignalID?
    
    /// What to compare ``firstSignal`` to. If not specified, ``firstSignal`` will be compared to ``constant``.
    public var secondSignal: SignalID?
    
    /// Constant to compare ``firstSignal`` to. Has no effect when ``secondSignal`` is set. When neither ``secondSignal`` nor `constant` are specified, the effect is as though `constant` were specified with the value 0.
    public var constant: Int?
    
    
    public init(comparator: Comparator? = nil, firstSignal: SignalID? = nil, secondSignal: SignalID? = nil, constant: Int? = nil) {
        self.comparator = comparator
        self.firstSignal = firstSignal
        self.secondSignal = secondSignal
        self.constant = constant
    }
    
    
    public enum Comparator: String, Codable {
        case equalTo = "="
        case greaterThan = ">"
        case lesserThan = "<"
        case greaterThanOrEqualTo = "≥"
        case lesserThanOrEqualTo = "≤"
        case notEqualTo = "≠"
    }
    
    enum CodingKeys: String, CodingKey {
        case comparator
        case firstSignal = "first_signal"
        case secondSignal = "second_signal"
        case constant
    }
    
}


extension CircuitCondition: CustomStringConvertible {
    
    public var description: String {
        (self.firstSignal?.description ?? "(blank)") + " " + (self.comparator?.rawValue ?? "<") + " " + (self.secondSignal?.description ?? self.constant?.description ?? "0")
    }
}
