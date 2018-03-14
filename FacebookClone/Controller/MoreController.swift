//
//  MoreController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/27/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class MoreController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    let profilePictureSize: CGFloat = 60
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.bounds, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = Const.COLOR_FACEBOOK_LIGHT_GRAY
        tv.tableFooterView = UIView()
        return tv
    }()
    
    lazy var profileView: UIView = {
        let view = UIView()
        view.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        view.frame.size.height = 80
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleViewProfile)))
        view.isUserInteractionEnabled = true
        return view
    }()
    
    @objc func handleViewProfile() {
        print("Segueing...")
        let profileController = ProfileController()
        self.navigationController?.pushViewController(profileController, animated: true)
    }
    
    lazy var profilePictureView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "img_profile_picture")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = Const.COLOR_FACEBOOK_BLUE
        iv.layer.cornerRadius = profilePictureSize / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    let profileStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    let fullNameLabel: UILabel = {
        let lbl = UILabel()
        let fullName = Client.shared.getModelUser().firstName + Client.shared.getModelUser().lastName
        lbl.text = fullName == " " ? "Tap to set your name" : fullName
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    let viewProfielLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "View your profile"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = Const.COLOR_FACEBOOK_DARK_GRAY
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavView()
        
        view.addSubview(tableView)
        setupTableView()
        
        view.addSubview(profileView)
        tableView.tableHeaderView = profileView
        
        profileView.addSubview(profilePictureView)
        setupProfilePictureView()
        
        profileView.addSubview(profileStackView)
        setupProfileStackView()
        
        print(Client.shared.getModelUser().firstName + Client.shared.getModelUser().lastName)
    }
    
    func setupProfileStackView() {
        profileStackView.anchorWithConstraints(leftAnchor: profilePictureView.rightAnchor,
                                               leftConstant: 16,
                                               rightAnchor: view.rightAnchor,
                                               rightConstant: 32,
                                               centerYAnchor: profileView.centerYAnchor,
                                               heightConstant: profilePictureSize)
        profileStackView.addArrangedSubview(fullNameLabel)
        profileStackView.addArrangedSubview(viewProfielLabel)
    }
    
    func setupProfilePictureView() {
        profilePictureView.anchorWithConstraints(leftAnchor: profileView.leftAnchor,
                                                 leftConstant: 16,
                                                 centerYAnchor: profileView.centerYAnchor,
                                                 widthConstant: profilePictureSize,
                                                 heightConstant: profilePictureSize)
    }
    
    func setupTableView() {
        tableView.anchorWithConstraints(topAnchor: navigationView.bottomAnchor,
                                        leftAnchor: view.leftAnchor,
                                        bottomAnchor: view.bottomAnchor,
                                        rightAnchor: view.rightAnchor)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        return cell
    }
}







