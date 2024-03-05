//
//  Helper.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import Foundation

enum NetworkError: String, Error {
    case unableToCompleteError
    case invalidResponse
    case invalidData
    case authError
    case authorizationError
    case unknownError
    case decodingError
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointDelegate {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    
    func request() -> URLRequest
}

enum EndPoint {
    case getData
}

extension EndPoint: EndPointDelegate {
    
    var baseURL: String {
        return Constants.baseURL.rawValue
    }
    
    var path: String {
        return Constants.path.rawValue
    }

    var method: HTTPMethod {
        switch self {
        case .getData:
            return .get
        }
    }
    
    var header: [String: String]? {
        [Constants.headerKey.rawValue: Constants.headerValue.rawValue]
    }
    
    func request() -> URLRequest {
        
        guard var components = URLComponents(string: baseURL) else { fatalError("Base URL Error!!") }
        components.path = path
        
        guard let url = components.url else { fatalError("URL Error From Components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers = header {
            headers.forEach { key, value in
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
