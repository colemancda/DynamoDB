//
//  AttributeValueUpdate.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

/// For the UpdateItem operation, represents the attributes to be modified, 
/// the action to perform on each, and the new value for each.
///
/// - Note: You cannot use UpdateItem to update any primary key attributes.
/// Instead, you will need to delete the item, and then use PutItem to create a new item with new attributes.
/// 
/// Attribute values cannot be null; string and binary type attributes must have lengths greater than zero;
/// and set type attributes must not be empty. Requests with empty values will be rejected with a 
/// ValidationException exception.
///
/// - SeeAlso: [API Reference](http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_AttributeValueUpdate.html)
public struct AttributeValueUpdate {
    
    /// Specifies how to perform the update. 
    /// Valid values are PUT (default), DELETE, and ADD. 
    /// The behavior depends on whether the specified primary key already exists in the table.
    public var action = Action()
    
    /// Represents the data for an attribute. You can set one, and only one, of the elements.
    ///
    /// Each attribute in an item is a name-value pair. 
    /// An attribute can be single-valued or multi-valued set.
    /// For example, a book item can have title and authors attributes. 
    /// Each book has one title but can have many authors. 
    /// The multi-valued attribute is a set; duplicate values are not allowed.
    public var value: AttributeValue
}

// MARK: - Supporting Types

public extension AttributeValueUpdate {
    
    /// Specifies how to perform the update.
    public enum Action: String {
        
        case ADD, PUT, DELETE
        
        public init() { self = .PUT }
    }
}