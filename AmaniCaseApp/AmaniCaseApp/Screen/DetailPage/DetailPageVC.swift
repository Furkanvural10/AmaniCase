//
//  DetailPageVC.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import UIKit
import SnapKit
import Kingfisher

protocol DetailPageVCDelegate: AnyObject {
    func updateUI(detail: Detail)
}

final class DetailPageVC: UIViewController {
    
    // MARK: - Properties
    var detail: Detail?
    weak var delegate: DetailPageVCDelegate?
    
    
    // MARK: - UI Components
    private var detailTitle: UILabel = {
        let title = UILabel()
        return title
    }()
    
    private var definitionTitle: UILabel = {
        let definition = UILabel()
        definition.numberOfLines = 0
        definition.adjustsFontSizeToFitWidth = true
        return definition
    }()
    
    private var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.backToHomePageButtonTitle.rawValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private var detailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
        
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let detail = detail else { return }
        view.backgroundColor = .white
        
        // MARK: - Back Button
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.06)
        }
        
        backButton.addTarget(self, action: #selector(openMainPage), for: .touchUpInside)
        
        // MARK: - Title Label
        detailTitle.text = detail.title
        
        view.addSubview(detailTitle)
        detailTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        // MARK: - Definition Label
        definitionTitle.text = detail.description
        view.addSubview(definitionTitle)

        definitionTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(detailTitle.snp.bottom).offset(5)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        // MARK: - Detail Image View
        if let url = URL(string: detail.base64) { detailImage.kf.setImage(with: url) }
        view.addSubview(detailImage)
        detailImage.snp.makeConstraints { make in
            make.top.equalTo(definitionTitle.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    @objc private func openMainPage() {
        guard let detail else { return }
        delegate?.updateUI(detail: detail)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
