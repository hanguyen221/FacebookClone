//
//  NotificationCell.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/29/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    private let IMAGE_HEIGHT: CGFloat = 66
    private let HORIZONTAL_SPACE: CGFloat = 10
    
    let notiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .darkGray
        label.numberOfLines = 3
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.numberOfLines = 1
        return label
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .green
        sv.alignment = .leading
        sv.distribution = .fill
        sv.axis = .vertical
        sv.spacing = 2
        return sv
    }()
    
    private let notiImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ic_notifications")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(notiImageView)
        setupNotiImageView()
        
        addSubview(stackView)
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.addArrangedSubview(notiLabel)
        stackView.addArrangedSubview(timeLabel)
        stackView.anchorWithConstraints(leftAnchor: notiImageView.rightAnchor,
                                        leftConstant: HORIZONTAL_SPACE,
                                        rightAnchor: rightAnchor,
                                        rightConstant: HORIZONTAL_SPACE,
                                        centerYAnchor: centerYAnchor)
    }
    
    private func setupNotiImageView() {
        notiImageView.anchorWithConstraints(leftAnchor: leftAnchor,
                                            leftConstant: HORIZONTAL_SPACE,
                                            centerYAnchor: centerYAnchor,
                                            widthConstant: IMAGE_HEIGHT,
                                            heightConstant: IMAGE_HEIGHT)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}










