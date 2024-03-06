//
//  DetailPageVMTest.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation

import XCTest
@testable import AmaniCaseApp

final class DetailPageVMTests: XCTestCase {
    
    var validURLString: String!
    var invalidURLString: String!
    
    override func setUp() {
        super.setUp()
        validURLString = "https://example1.com/image.png"
        invalidURLString = "invalidURL"
    }
    
    override func tearDown() {
        validURLString = nil
        invalidURLString = nil
        super.tearDown()
    }
    
    func test_InitWithValidURL_ShouldReturnEqual() {
        let detail = Detail(id: 1, title: "Title", base64: validURLString, description: "Desc.")
        let viewModel = DetailPageVM(data: detail)
        
        XCTAssertEqual(viewModel.imageURL, validURLString, "imageURL should be set with a valid URL string.")
    }
    
    func test_InitWithInvalidURL_ShouldReturnNil() {
        let detail = Detail(id: 1, title: "Title", base64: invalidURLString, description: "Desc.")
        let viewModel = DetailPageVM(data: detail)
        
        XCTAssertNil(viewModel.imageURL, "imageURL should not be set with an invalid URL string.")
    }
}
