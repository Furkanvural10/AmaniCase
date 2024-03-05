//
//  ListPageVM.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import Foundation

protocol ListPageViewModelProtocol {
    func fetchUserContents(completion: @escaping () -> Void)
}

final class ListPageViewModel {
    var details: [Detail] = []
    var errorMessage: String?
    
    private let userRequestContent: UserRequestContentProtocol

    init(userRequestContent: UserRequestContentProtocol = UserRequestContent.shared) {
        self.userRequestContent = userRequestContent
    }
}

extension ListPageViewModel: ListPageViewModelProtocol {
    
    func fetchUserContents(completion: @escaping () -> Void) {
            self.userRequestContent.getUserContentData { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let userContent):
                        self?.details = userContent.images
                        completion()
                    case .failure(let error):
                        self?.errorMessage = error.rawValue
                        completion()
                    }
                }
            }
        }
}
