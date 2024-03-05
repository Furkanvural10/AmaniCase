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
    private init() {}
}

extension UserRequestContent: UserRequestContentProtocol {
    
    static let shared = UserRequestContent()
    
    
    func getUserContentData(completion: @escaping (Result<UserContent, NetworkError>) -> Void) {
        let endPoint = EndPoint.getData
        NetworkManager.shared.request(endPoint, completion: completion)
    }
}
