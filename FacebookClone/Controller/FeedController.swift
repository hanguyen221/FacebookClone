//
//  FeedController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/26/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class FeedController: BaseController {
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "This is feed"
        label.textAlignment = .center
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("     Let's log in     ", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(presentLoginController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(loginButton)
        setupWelcomeLabel()
        setupLoginButton()
    }
    
    func setupWelcomeLabel() {
        welcomeLabel.anchorWithConstraints(centerXAnchor: view.centerXAnchor,
                                           centerYAnchor: view.centerYAnchor)
    }
    
    func setupLoginButton() {
        loginButton.anchorWithConstraints(topAnchor: welcomeLabel.topAnchor,
                                          topConstant: 100,
                                          centerXAnchor: view.centerXAnchor)
    }
    
    func presentLoginController() {
        let loginVC = LoginController()
        present(loginVC, animated: true, completion: nil)
    }
    
}













