//
//  Constants.swift
//  MadeInKuwait
//
//  Created by mostafa elsanadidy on 1/29/22.
//  Copyright © 2022 mostafa elsanadidy. All rights reserved.
//

import Alamofire

struct Constants {
    
    static var deviceID = UIDevice.current.identifierForVendor!.uuidString
    static let randomQueue =  DispatchQueue(label: "randomQueue", qos: .utility)
    
    struct ProductionServer {
        static let baseURL = "https://api.github.com/orgs/square"
    }
    
    enum APIParameters :String{
        case message
        case code
        case token
        case status_code
    }
    
    enum HTTPHeaderField: String {
        case token = "x-access-token"
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case Language = "Accept-Language"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}

