//
//  FriendRequestCell.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/30/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class FriendRequestCell: UITableViewCell {
    
    private let IMAGE_HEIGHT: CGFloat = 66
    private let HORIZONTAL_SPACE: CGFloat = 10
    var controller: FriendRequestsController?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.anchorWithConstraints(heightConstant: 16)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let mutualFriendLabel: UILabel = {
        let label = UILabel()
        label.anchorWithConstraints(heightConstant: 14)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var buttonsView: UIView = {
        let view = UIView()
        view.anchorWithConstraints(heightConstant: 28)
        view.backgroundColor = .red
        return view
    }()
    
    lazy var addFriendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add friend", for: .normal)
        button.setTitleColor(Const.COLOR_FACEBOOK_WHITE, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
        button.backgroundColor = Const.COLOR_FACEBOOK_MEDIUM_BLUE
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()
    
    func handleAddFriend() {
        print("Friend added")
    }
    
    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
        button.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        button.addTarget(self.controller, action: #selector(handleDelete), for: .touchUpInside)
        return button
    }()
    
    func handleDelete() {
        print("Request deleted")
    }
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .green
        sv.alignment = .leading
        sv.distribution = .fill
        sv.axis = .vertical
        sv.spacing = 2
        return sv
    }()
    
    let requestImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ic_friendsRequest")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(requestImageView)
        addSubview(stackView)
        
        setupRequestImageView()
        setupStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupRequestImageView() {
        requestImageView.anchorWithConstraints(leftAnchor: leftAnchor,
                                               leftConstant: HORIZONTAL_SPACE,
                                               centerYAnchor: centerYAnchor,
                                               widthConstant: IMAGE_HEIGHT,
                                               heightConstant: IMAGE_HEIGHT)
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(mutualFriendLabel)
        stackView.addArrangedSubview(buttonsView)
        stackView.anchorWithConstraints(leftAnchor: requestImageView.rightAnchor,
                                        leftConstant: HORIZONTAL_SPACE,
                                        rightAnchor: rightAnchor,
                                        rightConstant: HORIZONTAL_SPACE,
                                        centerYAnchor: centerYAnchor)
        setupButtonsView()
    }
    
    private let BUTTON_WIDTH: CGFloat = 100
    
    func setupButtonsView() {
        buttonsView.addSubview(addFriendButton)
        addFriendButton.anchorWithConstraints(topAnchor: buttonsView.topAnchor,
                                              leftAnchor: buttonsView.leftAnchor,
                                              bottomAnchor: buttonsView.bottomAnchor,
                                              widthConstant: BUTTON_WIDTH)
        addFriendButton.addTarget(self.controller, action: #selector(handleAddFriend), for: .touchUpInside)

        buttonsView.addSubview(deleteButton)
        deleteButton.anchorWithConstraints(topAnchor: buttonsView.topAnchor,
                                           leftAnchor: addFriendButton.rightAnchor,
                                           leftConstant: 16,
                                           bottomAnchor: buttonsView.bottomAnchor,
                                           widthConstant: BUTTON_WIDTH)

    }
}










