//
//  ViewModel.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 5.03.2024.
//

import Foundation
import XCTest
@testable import AmaniCaseApp

final class MainPageVMTests: XCTestCase {

    var sut: MainPageVM!

    override func setUp() {
        super.setUp()
        sut = MainPageVM()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_UpdateDetail_ShouldTriggerUpdateViewClosure() {
        
        let expectation = self.expectation(description: "updateViewClosure called")
        sut.updateViewClosure = {
            expectation.fulfill()
        }

        let testDetail = Detail(id: 1, title: "Custom Title", base64: "Custom Jpeg", description: "Custom Des.")
        sut.updateDetail(detail: testDetail)

        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNil(error, "updateViewClosure was not called")
        }
    }

    func test_UpdateDetail_ShouldUpdateDetailProperty() {
    
        let testDetail = Detail(id: 2, title: "Custom Title 2", base64: "Custom Jpeg 2", description: "Custom Des. 2")
        sut.updateDetail(detail: testDetail)

        XCTAssertEqual(sut.detail?.id, testDetail.id)
        XCTAssertEqual(sut.detail?.title, testDetail.title)
        XCTAssertEqual(sut.detail?.description, testDetail.description)
    }

}
