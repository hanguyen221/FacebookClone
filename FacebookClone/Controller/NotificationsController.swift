//
//  NotificationsController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/27/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class NotificationsController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .lightGray
        return tv
    }()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        setupTableView()
        
        tableView.register(NotificationCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.anchorWithConstraints(topAnchor: view.topAnchor,
                                        leftAnchor: view.leftAnchor,
                                        bottomAnchor: view.bottomAnchor,
                                        rightAnchor: view.rightAnchor)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NotificationCell
        cell.textLabel?.text = "Notification"
        cell.detailTextLabel?.text = "Date and time"
        return cell
    }
}
