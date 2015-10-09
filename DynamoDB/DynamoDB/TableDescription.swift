//
//  TableDescription.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

/// Represents the properties of a table.
public struct TableDescription {
    
    /// The name of the table.
    ///
    /// - Note: Minimum length of 3. Maximum length of 255.
    public var name: String
    
    /// An array of ```AttributeDefinition```.
    /// Each of these objects describes one attribute in the table and index key schema.
    public var attributeDefinitions: [AttributeDefinition]
    
    /// The date and time when the table was created.
    public var creationDateTime: Date
    
    //public var globalSecondaryIndexes:
    
    
}

// MARK: - Supporting Types

public extension TableDescription {
    
    /// The current state of the table.
    public enum TableStatus: String {
        
        /// The table is being created.
        case Creating = "CREATING"
        
        /// The table is being updated.
        case Updating = "UPDATING"
        
        /// The table is being deleted.
        case Deleting = "DELETING"
        
        /// The table is ready for use.
        case Active = "ACTIVE"
    }
}

// MARK: - JSON

public extension TableDescription {
    
    private enum JSONKey: String {
        
        case AttributeDefinitions, CreationDateTime, GlobalSecondaryIndexes, ItemCount, KeySchema, LatestStreamArn, LatestStreamLabel, LocalSecondaryIndexes, ProvisionedThroughput, StreamSpecification, TableArn, TableName, TableSizeBytes, TableStatus
    }
    
    
}