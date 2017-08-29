//
//  NotificationCell.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/29/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    private let notiImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ic_notifications")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(notiImageView)
        setupNotiImageView()
    }
    
    private func setupNotiImageView() {
        notiImageView.anchorWithConstraints(leftAnchor: leftAnchor,
                                            leftConstant: 16,
                                            centerYAnchor: centerYAnchor,
                                            widthConstant: 44,
                                            heightConstant: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
