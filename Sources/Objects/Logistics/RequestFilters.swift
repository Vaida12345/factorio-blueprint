//
//  RequestFilters.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct RequestFilters: Codable, Equatable {
    
    public var sections: [LogisticSection]
    
    public var request_from_buffers: Bool
    
}


extension RequestFilters: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<RequestFilters>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.sequence(for: \.sections)
            descriptor.value(for: \.request_from_buffers)
        }
    }
}
