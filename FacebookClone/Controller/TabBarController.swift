//
//  TabBarController.swift
//  FacebookClone
//
//  Created by Ha Nguyen on 8/27/17.
//  Copyright © 2017 Ha Nguyen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        
        let feedController = FeedController()
        feedController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_newsfeed"), tag: 0)
        
        let friendRequestsController = FriendRequestsController()
        friendRequestsController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_friendsRequest"), tag: 1)
        
        let messagesController = MessagesController()
        messagesController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_messages"), tag: 2)

        let notificationsController = NotificationsController()
        notificationsController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_notifications"), tag: 3)

        let moreController = MoreController()
        moreController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_more"), tag: 4)
        
        
        controllers = [feedController, friendRequestsController, messagesController, notificationsController, moreController]
        controllers.forEach {
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        self.viewControllers = controllers
    }
}
