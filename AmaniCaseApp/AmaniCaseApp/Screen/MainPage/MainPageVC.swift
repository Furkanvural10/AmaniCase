//
//  ViewController.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import UIKit

final class MainPageViewController: UIViewController {
    
    // MARK: - Prop.
    private let viewModel = MainPageVM()
    private var titleLabel: UILabel!
    private var idLabel: UILabel!
    
    // MARK: - Lifecycle M.
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureView()
        bindViewModel()
    }
    
    private func configureView() {
        
        // MARK: - View Config.
        view.backgroundColor = .systemBackground
        
        // MARK: - Title Label Config.
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // MARK: - ID Label Config.
        idLabel = UILabel()
        view.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).inset(50)
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.mainRightBarButtonItemTitle.rawValue, style: .plain, target: self, action: #selector(didTapBookmarks))
    }
    
    private func bindViewModel() {
        viewModel.updateViewClosure = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.titleLabel.text = self.viewModel.detail?.title
                self.idLabel.text = String(self.viewModel.detail?.id ?? 0)
            }
        }
    }
    
    
    // MARK: - Actions For NB.
    @objc private func didTapBookmarks() {
        navigateToListPageViewController()
    }
    
    
    // MARK: - Navigation to List Page
    private func navigateToListPageViewController() {
        let listPageViewController = ListPageViewController()
        navigationController?.pushViewController(listPageViewController, animated: true)
    }
}

extension MainPageViewController: DetailPageVCDelegate {
    
    // MARK: - Update UI
    func updateUI(detail: Detail) {
        viewModel.updateDetail(detail: detail)
    }
}


