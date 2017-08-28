//
//  NotificationsController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/27/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class NotificationsController: BaseController {
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "This is notifications"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        setupWelcomeLabel()
    }
    
    func setupWelcomeLabel() {
        welcomeLabel.anchorWithConstraints(topAnchor: view.topAnchor,
                                           leftAnchor: view.leftAnchor,
                                           widthConstant: view.frame.width,
                                           heightConstant: view.frame.height)
    }
}
