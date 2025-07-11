//
//  autoencode.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-11.
//

import Testing
@testable
import factorio_blueprint


@Suite
struct AutoEncode {
    @Test func simple() async throws {
        let string = """
        0eNp1jkEKwjAQRe/y12nRaCzJVaRIq4ME2klJpmIpubtpXbhyN/OZ9/6s6IeZpuhZ4Fb4e+AEd12R/JO7Ycu4GwkOEjtOU4hS9TQIsoLnB73hjrlVIBYvnr7sviw3nseeYjlQfxwKU0gFC7z1FFWla6OwlOFUm7x5vdBYwN+TCi+KaUfMRduztaY5aNNYnfMHdcJD1A==
        """
        
        let model = try Blueprint.parse(string)
        let data = try model.makeBlueprintString() // Swift zlib can only encode level 5
        #expect(data == "0eJxtztEKwjAMBdB/uc91aLWO9ldEZNMggS0dbSeO0n+3w4EvvoVwc24y+mGmKbAkuAy+e4lwl4zIT+mGdSfdSHBIoZM4+ZB2PQ0JRYHlQW+4Q7kqvChE9gJnztqerDXtXpvWagWSxInpq/63FCYfa2i9z6jkTjdGYanDsTFlM5abzGNPYWvkRGOlfu+X8gGKBEPU") // tested on factorio
        #expect(try model == Blueprint.parse(data))
    }
    
    @Test func adler32() async throws {
        let data = "Wikipedia".data(using: .ascii)!
        #expect(BlueprintStringParser.adler32(data) == (300286872 as UInt32).bigEndian)
    }
}
