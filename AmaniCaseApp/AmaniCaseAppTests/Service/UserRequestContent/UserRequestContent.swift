//
//  UserRequestContent.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation
@testable import AmaniCaseApp

final class MockUserRequestContent: UserRequestContentProtocol {
    var fetchUserContentsCalled = false
    var fetchCompletionHandler: ((Result<UserContent, NetworkError>) -> Void)?

    func getUserContentData(completion: @escaping (Result<UserContent, NetworkError>) -> Void) {
        fetchUserContentsCalled = true
        fetchCompletionHandler = completion
    }

    func completeWithSuccess(userContent: UserContent) {
        fetchCompletionHandler?(.success(userContent))
    }

    func completeWithError(error: NetworkError) {
        fetchCompletionHandler?(.failure(error))
    }
}
