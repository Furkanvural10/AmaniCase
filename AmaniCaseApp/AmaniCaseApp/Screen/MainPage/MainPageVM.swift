//
//  MainPageVM.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import Foundation

protocol MainPageVMProtocol {
    var detail: Detail? { get set }
    var updateViewClosure: (() -> Void)? { get set }
    func updateDetail(detail: Detail)
}

final class MainPageVM {
    
    var detail: Detail? {
        didSet {
            updateViewClosure?()
        }
    }
    
    var updateViewClosure: (() -> Void)?
    
    init() {}
    
    func updateDetail(detail: Detail) {
        self.detail = detail
    }
}

extension MainPageVM: MainPageVMProtocol {}
