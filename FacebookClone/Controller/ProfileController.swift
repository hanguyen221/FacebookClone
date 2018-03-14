//
//  ProfileController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 10/8/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class ProfileController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    let profilePictureSize: CGFloat = 100
    let coverPhotoHeight: CGFloat = 150
    let actionViewHeight: CGFloat = 130
    let cellId = "cellId"
    
    let profileLabels = ["Email", "Username", "First name", "Last name", "Phone number"]
    let profileContents = [
        Client.shared.getModelUser().email,
        Client.shared.getModelUser().username,
        Client.shared.getModelUser().firstName,
        Client.shared.getModelUser().lastName,
        Client.shared.getModelUser().phoneNumber
    ]
    
    let headerView: UIView = {
        let view = UIView()
        view.frame.size.height = 280
        return view
    }()
    
    let coverPhotoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = Const.COLOR_FACEBOOK_BLUE
        return iv
    }()
    
    lazy var profilePictureView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "img_profile_picture")
        iv.layer.cornerRadius = profilePictureSize / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    let actionView: UIView = {
        let view = UIView()
        view.backgroundColor = Const.COLOR_FACEBOOK_LIGHT_GRAY
        return view
    }()
    
    let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit profile", for: .normal)
        button.setTitleColor(Const.COLOR_FACEBOOK_WHITE, for: .normal)
        button.backgroundColor = Const.COLOR_FACEBOOK_BLUE
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleEditProfile), for: .touchUpInside)
        return button
    }()
    
    @objc func handleEditProfile() {
        let editProfileController = EditProfileController()
        editProfileController.profileLabels = self.profileLabels
        editProfileController.profileContents = self.profileContents
        navigationController?.pushViewController(editProfileController, animated: true)
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.bounds, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.showsVerticalScrollIndicator = false
        tv.allowsSelection = false
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        navigationItem.title = "Your profile"
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavView()
        
        view.addSubview(tableView)
        setupTableView()
        view.addSubview(headerView)
        tableView.tableHeaderView = headerView
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
        
        headerView.addSubview(coverPhotoView)
        setupCoverPhotoView()
        
        headerView.addSubview(actionView)
        setupActionView()
        
        actionView.addSubview(editProfileButton)
        setupEditProfileButton()
        
        headerView.addSubview(profilePictureView)
        setupProfilePictureView()
        
        
    }
    
    func setupCoverPhotoView() {
        coverPhotoView.anchorWithConstraints(topAnchor: headerView.topAnchor,
                                             leftAnchor: headerView.leftAnchor,
                                             rightAnchor: headerView.rightAnchor,
                                             heightConstant: coverPhotoHeight)
    }
    
    func setupProfilePictureView() {
        profilePictureView.anchorWithConstraints(centerXAnchor: headerView.centerXAnchor,
                                                 centerYAnchor: coverPhotoView.bottomAnchor,
                                                 widthConstant: profilePictureSize,
                                                 heightConstant: profilePictureSize)
    }
    
    func setupActionView() {
        actionView.anchorWithConstraints(topAnchor: coverPhotoView.bottomAnchor,
                                         leftAnchor: headerView.leftAnchor,
                                         rightAnchor: headerView.rightAnchor,
                                         heightConstant: actionViewHeight)
    }
    
    func setupEditProfileButton() {
        editProfileButton.anchorWithConstraints(bottomAnchor: actionView.bottomAnchor,
                                                bottomConstant: 16,
                                                centerXAnchor: actionView.centerXAnchor,
                                                widthConstant: 100,
                                                heightConstant: 30)
    }
    
    func setupTableView() {
        tableView.anchorWithConstraints(topAnchor: navigationView.bottomAnchor,
                                        leftAnchor: view.leftAnchor,
                                        bottomAnchor: view.bottomAnchor,
                                        rightAnchor: view.rightAnchor)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        cell.profileLabel.text = profileLabels[indexPath.row]
        cell.contentTextField.text = profileContents[indexPath.row]
        cell.contentTextField.isEnabled = false
        return cell
    }
}







