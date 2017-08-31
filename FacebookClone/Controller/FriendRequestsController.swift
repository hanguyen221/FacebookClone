//
//  FriendRequestsController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/27/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class FriendRequestsController: BaseController, UITableViewDataSource, UITableViewDelegate {
    
    let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .lightGray
        tv.allowsSelection = false
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        setupTableView()
        
        tableView.register(FriendRequestCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func setupTableView() {
        tableView.anchorWithConstraints(topAnchor: view.topAnchor,
                                        leftAnchor: view.leftAnchor,
                                        bottomAnchor: view.bottomAnchor,
                                        rightAnchor: view.rightAnchor)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FriendRequestCell
        cell.nameLabel.text = "Jack"
        cell.mutualFriendLabel.text = "5 mutual friends"
        cell.controller = self
        cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return cell
    }
}
