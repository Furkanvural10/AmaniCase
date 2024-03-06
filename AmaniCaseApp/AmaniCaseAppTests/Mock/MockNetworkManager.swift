//
//  MockNetworkManager.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation
@testable import AmaniCaseApp

final class MockNetworkManager: NetworkManagerProtocol {
    func request<T>(_ endpoint: AmaniCaseApp.EndPoint, completion: @escaping (Result<T, AmaniCaseApp.NetworkError>) -> Void) where T : Decodable, T : Encodable {
        
    }
    
    var shouldReturnError = false
    
    func requestMock(_ endPoint: EndPoint, completion: @escaping (Result<UserContent, NetworkError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.unknownError))
        } else {
            let mockUserContent = UserContent(images: [Detail(id: 1, title: "Title", base64: "Base64", description: "Desc.")])
            completion(.success(mockUserContent))
        }
    }
}
