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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: 16 + 44 + 16,
                                  y: (textLabel?.frame.origin.y)! - 2,
                                  width: UIScreen.main.bounds.width - 16 - 44 - 16 - 16,
                                  height: (textLabel?.frame.size.height)!)
        
        textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        detailTextLabel?.frame = CGRect(x: 16 + 44 + 16,
                                  y: (detailTextLabel?.frame.origin.y)! + 2,
                                  width: UIScreen.main.bounds.width - 16 - 44 - 16 - 16,
                                  height: (detailTextLabel?.frame.size.height)!)
        detailTextLabel?.font = UIFont.systemFont(ofSize: 11)
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
