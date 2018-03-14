//
//  EditProfileController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 10/8/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class EditProfileController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    
    var profileLabels: [String] = []
    var profileContents: [String] = []
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.bounds, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.allowsSelection = false
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.COLOR_FACEBOOK_WHITE
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavView()
        navigationView.onRightBarButton = handleSave
        
        view.addSubview(tableView)
        setupTableView()
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func handleSave() {
        print("Saving...")
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
        cell.controller = self
        cell.profileLabel.text = profileLabels[indexPath.row]
        cell.contentTextField.text = profileContents[indexPath.row]
        if cell.contentTextField.text == "" {
            cell.contentTextField.placeholder = "Tap to add info"
        }
        return cell
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (super.textFieldShouldReturn(textField)) {
            return true
        }
        textField.resignFirstResponder()
        return true
    }
    
}










