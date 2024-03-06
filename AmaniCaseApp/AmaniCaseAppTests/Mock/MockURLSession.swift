//
//  MockURLSession.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation
@testable import AmaniCaseApp

final class MockURLSession: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = self.data
        let response = self.response
        let error = self.error
        return MockURLSessionDataTask {
            completionHandler(data, response, error)
        }
    }
}

final class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
