//
//  MainPageViewControllerTest.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation

import XCTest
@testable import AmaniCaseApp

final class MainPageViewControllerTests: XCTestCase {

    var sut: MainPageViewController!
    var mockViewModel: MockMainPageVM!
    var navigationController: UINavigationController!

    override func setUp() {
        super.setUp()
        mockViewModel = MockMainPageVM()
        sut = MainPageViewController()
        sut.viewModel = mockViewModel

        navigationController = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        mockViewModel = nil
        navigationController = nil
        super.tearDown()
    }
    
    func test_UpdateUI() {
        
        let detail = Detail(id: 1, title: "Test Title", base64: "Base64", description: "Description")
        mockViewModel.updateDetail(detail: detail)
        
        mockViewModel.updateViewClosure = { [weak self] in
            DispatchQueue.main.async {
                XCTAssertEqual(self?.sut.titleLabel.text, "Test Title", "titleLabel text should updated")
                XCTAssertEqual(self?.sut.idLabel.text, "1", "idLabel text should be updated")

            }
        }

        
    }
    
}
