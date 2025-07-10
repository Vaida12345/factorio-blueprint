//
//  CircuitNetworkSelection.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct CircuitNetworkSelection: Codable, Equatable {
    
    /// Defaults to `true`.
    public var red: Bool?
    
    /// Defaults to `true`.
    public var green: Bool?
    
    
    public init(red: Bool? = nil, green: Bool? = nil) {
        self.red = red
        self.green = green
    }
    
    public static var both: CircuitNetworkSelection {
        CircuitNetworkSelection(red: true, green: true)
    }
}


extension CircuitNetworkSelection: CustomStringConvertible {
    
    public var description: String {
        switch (red ?? true, green ?? true) {
        case (true, true): "[red, green]"
        case (false, true): "[green]"
        case (true, false): "[red]"
        case (false, false): "[]"
        }
    }
}
