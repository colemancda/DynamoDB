//
//  AWSSignature.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/9/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation
//import OpenSSL

public extension AWS {
    
    public struct Signature {
        
        public struct V4 {
            
            public static let Algorithm = "AWS4-HMAC-SHA256"
            
            public static let Terminator = "aws4_request"
            
            
        }
    }
}
