//
//  AttributeValue.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

/// Represents the data for an attribute. You can set one, and only one, of the elements.
///
/// Each attribute in an item is a name-value pair. An attribute can be single-valued or multi-valued set.
/// For example, a book item can have title and authors attributes. 
/// Each book has one title but can have many authors. 
/// The multi-valued attribute is a set; duplicate values are not allowed.
public enum AttributeValue: String {
    
    /// A Binary data type.
    case Binary = "B" // Type: Blob
    
    /// A Boolean data type.
    case Boolean = "BOOL" // Type: Boolean
    
    /// A Binary Set data type.
    case BinarySet = "BS" // Type: array of Blobs
    
    /// A List of attribute values.
    case List = "L" // Type: array of AttributeValue objects
    
    /// A Map of attribute values.
    case Map = "M" // Type: String to AttributeValue object map
    
    /// A Number data type.
    case Number = "N" // Type: String
    
    /// A Number Set data type.
    case NumberSet = "NS" // Type: array of Strings
    
    /// A Null data type.
    case Null = "NULL" // Type: Boolean
    
    /// A String data type.
    case String = "S"
    
    /// A String Set data type.
    case StringSet = "SS" // Type: array of Strings
    
}