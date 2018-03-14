//
//  ProfileCell.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 10/8/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    var controller: EditProfileController?
    
    let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    lazy var contentTextField: UITextField = {
        let tf = UITextField()
        tf.delegate = controller
        return tf
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileLabel)
        setupProfileLabel()
        
        addSubview(contentTextField)
        setupContentTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupProfileLabel() {
        profileLabel.anchorWithConstraints(leftAnchor: self.leftAnchor,
                                           leftConstant: 16,
                                           centerYAnchor: self.centerYAnchor)
    }
    
    func setupContentTextField() {
        contentTextField.anchorWithConstraints(rightAnchor: self.rightAnchor,
                                               rightConstant: 16,
                                               centerYAnchor: self.centerYAnchor)
    }
    
}







