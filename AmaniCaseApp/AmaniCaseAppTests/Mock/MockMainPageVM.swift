//
//  MockMainPageVM.swift
//  AmaniCaseAppTests
//
//  Created by furkan vural on 6.03.2024.
//

import Foundation
@testable import AmaniCaseApp

final class MockMainPageVM: MainPageVMProtocol {
    var detail: Detail?
    var updateViewClosure: (() -> Void)?
    
    var updateDetailCalled = false

    func updateDetail(detail: Detail) {
        self.detail = detail
        updateDetailCalled = true
        updateViewClosure?()
    }
}
