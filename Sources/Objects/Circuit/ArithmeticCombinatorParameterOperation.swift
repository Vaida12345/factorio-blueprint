//
//  ArithmeticCombinatorParameterOperation.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

public enum ArithmeticCombinatorParameterOperation: String, Codable, Equatable {
    
    case multiply = "*"
    case divide = "/"
    case plus = "+"
    case minus = "-"
    case modulo = "%"
    case power = "^"
    case leftShift = "<<"
    case rightShift = ">>"
    case and = "AND"
    case or = "OR"
    case xor = "XOR"
    
}
