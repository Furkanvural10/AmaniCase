//
//  MockListPageVM.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation
@testable import AmaniCaseApp

final class MockListPageViewModel: ListPageViewModelProtocol {
    var details: [Detail] = []
    var fetchUserContentsCalled = false

    func fetchUserContents(completion: @escaping () -> Void) {
        fetchUserContentsCalled = true
        completion()
    }
}
