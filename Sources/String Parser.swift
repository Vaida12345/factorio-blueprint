//
//  String Parser.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import Essentials
import Foundation
import Compression


struct BlueprintStringParser: Codable {
    
    var blueprint: Blueprint?
    
    var blueprint_book: BlueprintBook?
    
    static func parse(_ input: String) throws -> BlueprintStringParser {
        guard let data = Data(base64Encoded: String(input.dropFirst())) else { throw ParserError.corruptedString }
        let header = data[0..<2]
        print(header[0], header[0].data.binaryDigits) // CMF
        print(header[1]) // FLG
        print(header[0] >> 4) // 7
        print(header[0] & 0b00001111) // 8
        print(header[1] & 0b00011111)
        print(header[1] >> 5 & 0b1)
        print(header[1] >> 6 & 0b00000011) // compression level
        let inflated = try data.dropFirst(2).decompressed(using: .zlib)
        return try BlueprintStringParser(data: inflated, format: .json)
    }
    
    func makeBlueprintString() throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = []
        let data = try encoder.encode(self)
        var header = Data(count: 2)
        header[0] |= 8
        header[0] |= 7 << 4
        
        header[1] |= 2 << 6
        header[1] |= 0 << 5 // no preset dictionary
        header[1] |= 28 // make divisible by 31
        
        let compressed = try header + data.compressed(using: .zlib) + BlueprintStringParser.adler32(data).data
        return "0" + compressed.base64EncodedString()
    }
    
    static func adler32(_ data: Data) -> UInt32 {
        let mod: UInt32 = 65521
        var a: UInt32 = 1
        var b: UInt32 = 0
        
        for byte in data {
            a = (a + UInt32(byte)) % mod
            b = (b + a) % mod
        }
        
        return (b << 16 | a).bigEndian
    }
    
}
