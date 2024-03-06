//
//  RequestUserContent.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import Foundation

protocol UserRequestContentProtocol {
    func getUserContentData(completion: @escaping (Result<UserContent, NetworkError>) -> Void)
}

final class UserRequestContent {
    
    private let networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
}

extension UserRequestContent: UserRequestContentProtocol {
    
    static let shared = UserRequestContent()
    
    func getUserContentData(completion: @escaping (Result<UserContent, NetworkError>) -> Void) {
        let endPoint = EndPoint.getData
        networkManager.request(endPoint, completion: completion)
    }
}
