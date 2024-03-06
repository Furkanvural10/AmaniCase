//
//  ListPageVMTest.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation
import XCTest
@testable import AmaniCaseApp

final class ListPageViewModelTests: XCTestCase {
    
    var sut: ListPageViewModel!
    var mockUserRequestContent: MockUserRequestContent!

    override func setUp() {
        super.setUp()
        mockUserRequestContent = MockUserRequestContent()
        sut = ListPageViewModel(userRequestContent: mockUserRequestContent)
        
    }

    override func tearDown() {
        sut = nil
        mockUserRequestContent = nil
        super.tearDown()
    }

    func test_FetchUserContentsCallsUserRequestContent() {
        sut.fetchUserContents {}
        XCTAssertTrue(mockUserRequestContent.fetchUserContentsCalled)
    }

    func test_FetchUserContents_ShouldSuccessUpdatesDetails() {
        let expectation = self.expectation(description: "Fetch success")
        let mockDetails = [Detail(id: 1, title: "Test", base64: "Test Base 64", description: "Test Description")]

        sut.fetchUserContents {
            XCTAssertEqual(self.sut.details, mockDetails)
            expectation.fulfill()
        }

        mockUserRequestContent.completeWithSuccess(userContent: UserContent(images: mockDetails))
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testFetchUserContents_ShouldFailureSetsErrorMessage() {
        let expectation = self.expectation(description: "Fetch failure")
        sut.fetchUserContents {
            XCTAssertNotNil(self.sut.errorMessage)
            expectation.fulfill()
        }

        mockUserRequestContent.completeWithError(error: .invalidData)
        waitForExpectations(timeout: 1, handler: nil)
    }
}

protocol ListPageViewModelProtocol {
    var details: [Detail] { get }
    func fetchUserContents(completion: @escaping () -> Void)
}
