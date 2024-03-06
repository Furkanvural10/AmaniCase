//
//  CustomTableViewCellTest.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import XCTest
@testable import AmaniCaseApp

final class CustomTableViewCellTests: XCTestCase {

    var sut: CustomTableViewCell!
    var tableView: UITableView!
    let dataSource = MockTableViewDataSource()

    override func setUp() {
        super.setUp()
        let viewController = UIViewController()
        tableView = UITableView()
        viewController.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier.rawValue)
        tableView.dataSource = dataSource
        
        sut = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier.rawValue) as? CustomTableViewCell
    }

    override func tearDown() {
        sut = nil
        tableView = nil
        super.tearDown()
    }

    func testCellConfiguration() {
        let detail = Detail(id: 1, title: "Title", base64: "Base64", description: "Desc.")
        sut.configure(data: detail)
        
        XCTAssertEqual(sut.cellLabel.text, detail.title, "Cell label was not configured correctly")
    }
}


