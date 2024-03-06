//
//  CustomTableViewCell.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class CustomTableViewCell: UITableViewCell {
    
    static let identifier = Constants.tableViewCellIdentifier
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
     let cellLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellLabel)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(70)
        }
        
        cellLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(data: Detail) {
        cellLabel.text = data.title
        if let url = URL(string: data.base64) { cellImageView.kf.setImage(with: url) }
    }
}
