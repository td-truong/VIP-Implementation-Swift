//
//  UserCell.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import UIKit

class UserCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = label.font.withSize(16)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = label.font.withSize(13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
        }
        emailLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(8)
        }
    }
    
    func update(with viewModel: UserCellViewModel) {
        nameLabel.text = viewModel.nameText
        emailLabel.text = viewModel.emailText
    }
    
}

struct UserCellViewModel: Equatable {
    var nameText: String?
    var emailText: String?
}
