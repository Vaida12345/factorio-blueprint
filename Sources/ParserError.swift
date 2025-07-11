//
//  ParserError.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import Essentials


public enum ParserError: GenericError {
    /// The blueprint string is corrupted.
    case corruptedString
    case notBlueprint
    case notBlueprintBook
    case invalidWireArrayLength(Int)
    
    public var message: String {
        switch self {
        case .corruptedString:
            "The blueprint string is corrupted."
        case .notBlueprint:
            "The blueprint string is not a blueprint"
        case .notBlueprintBook:
            "The blueprint string is not a blueprint book"
        case .invalidWireArrayLength(let length):
            "Invalid wire array length: \(length), expected 4"
        }
    }
}
