//
//  Icon.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct Icon: Codable, Equatable {
    
    /// Index of the icon, 1-based.
    public var id: Int
    
    /// The icon that is displayed
    public var signal: SignalID
    
    
    public init(id: Int, signal: SignalID) {
        self.id = id
        self.signal = signal
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "index"
        case signal
    }
    
}


extension Icon: CustomStringConvertible {
    
    public var description: String {
        self.signal.description
    }
}
