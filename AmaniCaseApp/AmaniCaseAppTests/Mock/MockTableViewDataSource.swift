//
//  MockTableViewDataSource.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import UIKit
@testable import AmaniCaseApp


final class MockTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
