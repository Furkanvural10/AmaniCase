//
//  NetworkManager.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation

import XCTest
@testable import AmaniCaseApp

final class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager!
    var mockSession: MockURLSession!

    override func setUp() {
        super.setUp()
        sut = NetworkManager.shared
        mockSession = MockURLSession()
        sut.session = mockSession
    }

    override func tearDown() {
        sut = nil
        mockSession = nil
        super.tearDown()
    }

    func testRequest_Success() {
        
        let mockData = UserContent(images: [Detail(id: 1, title: "Title", base64: "Bas64", description: "Desc")])
        let data = try? JSONEncoder().encode(mockData)
        mockSession.data = data
        mockSession.response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        
        let expectation = self.expectation(description: "Success")
        var response: UserContent?
        var error: NetworkError?
        
        sut.request(EndPoint.getData) { (result: Result<UserContent, NetworkError>) in
            switch result {
            case .success(let model):
                response = model
            case .failure(let err):
                error = err
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotNil(response)
        XCTAssertNil(error)
    }
    
    
}
