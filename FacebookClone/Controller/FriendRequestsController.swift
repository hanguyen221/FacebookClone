//
//  FriendRequestsController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/27/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class FriendRequestsController: BaseController {
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .lightGray
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
