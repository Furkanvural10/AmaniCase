//
//  DetailPageVM.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 5.03.2024.
//

import Foundation
import UIKit

protocol DetailPageViewModelProtocol {
    
}

final class DetailPageVM {
    
    var imageURL: String?

    init(data: Detail) {
        guard let url = URL(string: data.base64), UIApplication.shared.canOpenURL(url) else { return }
        self.imageURL = data.base64
    }
}
