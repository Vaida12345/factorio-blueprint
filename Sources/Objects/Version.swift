//
//  Version.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//


public struct Version: Codable, Equatable, CustomStringConvertible {
    public let major: UInt16
    public let minor: UInt16
    public let patch: UInt16
    /// Factorio's developer version number
    public let build: UInt16
    
    public var description: String {
        "\(major).\(minor).\(patch):\(build)"
    }
    
    
    public init(major: UInt16, minor: UInt16, patch: UInt16, build: UInt16) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.build = build
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(UInt64.self)
        
        self.major = UInt16(value >> 48)
        self.minor = UInt16((value >> 32) & 0xFF)
        self.patch = UInt16((value >> 16) & 0xFF)
        self.build = UInt16(value & 0xFF)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        let value = UInt64(major) << 48 | UInt64(minor) << 32 | UInt64(patch) << 16 | UInt64(build)
        try container.encode(value)
    }
}
