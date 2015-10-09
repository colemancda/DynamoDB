//
//  Settings.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import SwiftFoundation

public extension DynamoDB {
    
    /// DynamoDB Settings
    public struct Settings {
        
        /// AWS Region
        public var region: String = "us-west-2"
        
        /// The URL of the DynamoDB API
        public var endpoint: String = "http://localhost:8000"
    }
}

