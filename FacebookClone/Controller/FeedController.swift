//
//  FeedController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/26/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class FeedController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.frame, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        let loginVC = LoginController()
//        present(loginVC, animated: false, completion: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavView()
        
        view.addSubview(tableView)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.anchorWithConstraints(topAnchor: navigationView.bottomAnchor,
                                        leftAnchor: view.leftAnchor,
                                        bottomAnchor: view.bottomAnchor,
                                        rightAnchor: view.rightAnchor)
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabBarController?.tabBar.isHidden = true
        showCustomerKeyboard(value: 2) { (value) in
            print("Got value: \(value)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func showCustomerKeyboard(value: Int?, onOK: @escaping (Double) -> Void) {
        let dlgKeyboard = DlgKeyboard()
        dlgKeyboard.modalPresentationStyle = .overFullScreen
        if let value = value {
            dlgKeyboard.valueLabel.text = String(value)
        }
        dlgKeyboard.onOK = onOK
        self.present(dlgKeyboard, animated: true, completion: nil)
    }

}













