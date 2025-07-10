//
//  BlueprintLogisticFilter.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public struct BlueprintLogisticFilter: Codable, Equatable {
    
    public var id: Int
    
    /// The type of the logistic filter.
    public var type: SignalID.`Type`?
    
    /// Name of the logistic filter.
    public var name: String?
    
    /// The prototype name of the quality.
    public var quality: Quality?
    
    /// The comparator for quality. nil if any quality.
    public var comparator: CircuitCondition.Comparator?
    
    public var count: Int?
    
    public var maxCount: Int?
    
    public var minimumDeliveryCount: Int?
    
    public var importFrom: String?
    
    
    public init(id: Int, type: SignalID.`Type`? = nil, name: String? = nil, quality: Quality? = nil, comparator: CircuitCondition.Comparator? = nil, count: Int?, maxCount: Int? = nil, minimumDeliveryCount: Int? = nil, importFrom: String? = nil) {
        self.id = id
        self.type = type
        self.name = name
        self.quality = quality
        self.comparator = comparator
        self.count = count
        self.maxCount = maxCount
        self.minimumDeliveryCount = minimumDeliveryCount
        self.importFrom = importFrom
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "index"
        case type
        case name
        case quality
        case comparator
        case count
        case maxCount = "max_count"
        case minimumDeliveryCount = "minimum_delivery_count"
        case importFrom = "import_from"
    }
    
}


extension BlueprintLogisticFilter: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<BlueprintLogisticFilter>) -> any DescriptionBlockProtocol {
        descriptor.container("BlueprintLogisticFilter #\(self.id)") {
            descriptor.optional(for: \.name)
            descriptor.optional(for: \.comparator)
            descriptor.optional(for: \.quality)
            descriptor.optional(for: \.type)
            descriptor.optional(for: \.count)
            descriptor.optional(for: \.maxCount)
            descriptor.optional(for: \.minimumDeliveryCount)
            descriptor.optional(for: \.importFrom)
        }
    }
}
