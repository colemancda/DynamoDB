//
//  ListTables.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

public extension DynamoDB {
    
    /// Returns an array of table names associated with the current account and endpoint. 
    /// The output from ```ListTables``` is paginated, with each page returning a maximum of 100 table names.
    ///
    /// - Parameter exclusiveStartTableName: The first table name that this operation will evaluate.
    /// Use the value that was returned for ```LastEvaluatedTableName``` in a previous operation,
    /// so that you can obtain the next page of results. Minimum length of 3. Maximum length of 255. 
    /// Pattern: ```[a-zA-Z0-9_.-]+```
    ///
    /// - Parameter limit: The first table name that this operation will evaluate. 
    /// Use the value that was returned for ```LastEvaluatedTableName``` in a previous operation, 
    /// so that you can obtain the next page of results.
    func listTables(exclusiveStartTableName startTableName: String? = nil, limit: Int? = nil) throws -> (lastEvaluatedTableName: String, tableNames: [String]) {
        
        // build request... 
        
        var request = HTTP.Request(URL: settings.endpoint)
        
        do {
            
            var jsonRequest = JSON.Object()
            
            if let startTableName = startTableName {
                
                jsonRequest[RequestJSONKey.ExclusiveStartTableName.rawValue] = .String(startTableName)
            }
            
            if let limit = limit {
                
                jsonRequest[RequestJSONKey.Limit.rawValue] = .Number(.Integer(limit))
            }
            
            let jsonString = JSON.Value.Object(jsonRequest).toString()!
            
            let jsonData = jsonString.toUTF8Data()
            
            request.body = jsonData
            
            // add authentication
            
        }
        
        // parse request
        
        let response = try self.client.sendRequest(request)
        
        let jsonResponse = try validateResponse(response)
        
        guard let jsonObject = jsonResponse.objectValue
            else { throw Error.InvalidResponse }
        
        let lastEvaluatedTableName: String?
        
        if let jsonTableName = jsonObject[ResponseJSONKey.LastEvaluatedTableName.rawValue] {
            
            guard let tableName = jsonTableName.rawValue as? String
                else { throw Error.InvalidResponse }
            
            lastEvaluatedTableName = tableName
        }
        else { lastEvaluatedTableName = nil }
        
        let tableNames: [String] = {
            
            guard let json = jsonObject[ResponseJSONKey.TableNames.rawValue],
                let stringArray = json.rawValue as? [String]
                else { throw Error.InvalidResponse }
            
            return stringArray
        }()
        
        return (lastEvaluatedTableName, tableNames)
    }
}

private enum RequestJSONKey: String {
    
    case ExclusiveStartTableName, Limit
}

private enum ResponseJSONKey: String {
    
    case LastEvaluatedTableName, TableNames
}