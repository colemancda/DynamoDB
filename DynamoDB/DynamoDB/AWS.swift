//
//  AWS.swift
//  DynamoDB
//
//  Created by Alsey Coleman Miller on 10/8/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

/// Represents an instance of the Amazon Web Services API.
public struct AWS {
    
    public var region: Region
    
    public var service: Service
    
    public init(region: Region, service: Service) {
        
        self.region = region
        self.service = service
    }
    
    /// Generates the URL from the specified region 
    public var URL: String {
        
        var url: String
        
        let separator: String
        
        if (service == .S3
            && (   region == .USEast1
                || region == .USWest1
                || region == .USWest2
                || region == .EUWest1
                || region == .APSoutheast1
                || region == .APNortheast1
                || region == .APSoutheast2
                || region == .SAEast1
                || region == .USGovWest1))
        { separator = "-" }
        else { separator = "." }
        
        if service == .S3 && region == .USEast1 {
            
            url = "https://s3.amazonaws.com"
        }
        
        else if service == .STS {
            
            if region == .CNNorth1 {
                
                url = "https://sts.cn-north-1.amazonaws.com"
            }
            else {
                
                url = "https://sts.amazonaws.com"
            }
        }
        
        else if service == .SimpleDB && region == .USEast1 {
            
            url = "https://sdb.amazonaws.com"
        }
        
        else {
            
            url = "https://" + service.rawValue + separator + region.rawValue + ".amazonaws.com"
        }
        
        // need to add ".cn" at end of URL if it is in China Region
        if region == .CNNorth1 {
            
            url += "cn"
        }
        
        return url
    }
}

// MARK: - Supporting Types

public extension AWS {
    
    public enum Region: String {
        
        case USEast1 = "us-east-1"
        case USWest2 = "us-west-2"
        case USWest1 = "us-west-1"
        case EUWest1 = "eu-west-1"
        case EUCentral1 = "eu-central-1"
        case APSoutheast1 = "ap-southeast-1"
        case APNortheast1 = "ap-northeast-1"
        case APSoutheast2 = "ap-southeast-2"
        case SAEast1 = "sa-east-1"
        case CNNorth1 = "cn-north-1"
        case USGovWest1 = "us-gov-west-1"
    }
    
    public enum Service: String {
        
        case APIGateway = "execute-api"
        case AutoScaling = "autoscaling"
        case CloudWatch = "monitoring"
        case CognitoIdentityBroker = "cognito-identity"
        case CognitoService = "cognito-sync"
        case DynamoDB = "dynamodb"
        case EC2 = "ec2"
        case ElasticLoadBalancing = "elasticloadbalancing"
        case Kinesis = "kinesis"
        case Lambda = "lambda"
        case MachineLearning = "machinelearning"
        case MobileAnalytics = "mobileanalytics"
        case S3 = "s3"
        case SES = "email"
        case SimpleDB = "sdb"
        case SNS = "sns"
        case SQS = "sqs"
        case STS = "sts"
    }
}