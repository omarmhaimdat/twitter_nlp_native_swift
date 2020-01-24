//
//  MainTabViewController.swift
//  twitter_nlp
//
//  Created by M'haimdat omar on 21-01-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        tabBar.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 0.1)
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.isTranslucent = true
    }
    
    func setupTabBar() {
        
        let vc = ViewController()
        
        let viewController = UINavigationController(rootViewController: vc)
        viewController.tabBarItem.image = UIImage(systemName: "text.bubble")
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 0, bottom: -1, right: 0)
        viewController.tabBarItem.title = "Tweets"
        
        viewControllers = [viewController]
        
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        let navigation = UINavigationBar.appearance()
        
        let navigationFont = UIFont(name: "Avenir", size: 20)
        let navigationLargeFont = UIFont(name: "Avenir-Heavy", size: 34)
        
        navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: navigationFont!]
        
        if #available(iOS 11, *) {
            navigation.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: navigationLargeFont!]
        }
    }
}
