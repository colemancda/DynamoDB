//
//  Error.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

public extension DynamoDB {
    
    public enum Error: ErrorType {
        
        /// Response could not be parsed.
        case InvalidResponse
        
        /// Error status code and error description returned.
        case ErrorStatusCode(Int, JSON.Object?)
    }
}
