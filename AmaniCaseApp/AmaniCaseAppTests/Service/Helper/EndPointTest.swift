//
//  EndPointTest.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 5.03.2024.
//

import Foundation
import XCTest

@testable import AmaniCaseApp

final class EndPointTest: XCTestCase {
    
    func test_GetDataRequestFunction_WhenCreateUrlRequestInstance_ShouldSuccess() {
        let endpoint = EndPoint.getData
        let request = endpoint.request()

        XCTAssertEqual(request.url?.absoluteString, Constants.baseURL.rawValue + Constants.path.rawValue)
        XCTAssertEqual(request.httpMethod, HTTPMethod.get.rawValue)
        XCTAssertEqual(request.value(forHTTPHeaderField: Constants.headerKey.rawValue), Constants.headerValue.rawValue)
    }
    
}
