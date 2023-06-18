//
//  APIRouter.swift
//  MadeInKuwait
//
//  Created by mostafa elsanadidy on 1/29/22.
//  Copyright © 2022 mostafa elsanadidy. All rights reserved.
//


import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getRepositories
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getRepositories:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getRepositories: return "/repos"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
            
        case.getRepositories:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var main_api_url = ""
        main_api_url = Constants.ProductionServer.baseURL + path
        let urlComponents = URLComponents(string: main_api_url)!
        let url = urlComponents.url!
        var urlRequest = URLRequest(url: url)
        
//        print("URLS REQUEST :\(urlRequest)")
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: Constants.HTTPHeaderField.contentType.rawValue)
        
//            // Parameters
//            if let parameters = parameters {
//                do {
//                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//
//                } catch {
//                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
//                }
//            }
        
        return urlRequest as URLRequest
    }
}
