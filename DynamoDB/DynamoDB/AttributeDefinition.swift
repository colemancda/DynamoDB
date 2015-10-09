//
//  AttributeDefinition.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

/// Represents an attribute for describing the key schema for the table and indexes.
public struct AttributeDefinition {
    
    /// A name for the attribute.
    ///
    /// - Note: Minimum length of 1. Maximum length of 255
    public var name: String
    
    /// The data type for the attribute.
    public var type: DataType
    
    public init(name: String, type: DataType) {
        
        self.name = name
        self.type = type
    }
}

// MARK: - Supporting Types

public extension AttributeDefinition {
    
    /// The data type for an attribute definition.
    public enum DataType: String {
        
        /// The attribute is of type String.
        case String = "S"
        
        /// The attribute is of type Number.
        case Number = "N"
        
        /// The attribute is of type Binary.
        case Binary = "B"
    }
}

// MARK: - JSON

public extension AttributeDefinition {
    
    private enum JSONKey: String {
        
        case AttributeName, AttributeType
    }
    
    
}