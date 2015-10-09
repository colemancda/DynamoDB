//
//  DynamoDB.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

/// Type for interacting with [**Amazon DynamoDB**](https://aws.amazon.com/dynamodb/)
///
/// - SeeAlso: [API Reference](http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/Welcome.html)
public struct DynamoDB {
    
    /// The URL of the AWS endpoint. 
    public var url: String
    
    public var client = HTTP.Client()
    
    public init() { }
}

internal extension DynamoDB {
    
    func validateResponse(response: HTTP.Response) throws -> JSON.Value {
        
        // validate status code
        guard response.statusCode == HTTP.StatusCode.OK.rawValue
            else { throw Error.ErrorStatusCode(response.statusCode, response.JSONValue?.objectValue) }
        
        // get JSON
        guard let json = response.JSONValue else { throw Error.InvalidResponse }
        
        return json
    }
}

internal extension HTTP.Response {
    
    var JSONValue: JSON.Value? {
        
        guard let jsonString = String(UTF8Data: self.body),
            let jsonResponse = JSON.Value(string: jsonString)
            else { return nil }
        
        return jsonResponse
    }
}