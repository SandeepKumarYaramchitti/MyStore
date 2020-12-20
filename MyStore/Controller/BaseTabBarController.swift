//
//  BaseTabBarController.swift
//  MyStore
//
//  Created by Sandeep Kumar  Yaramchitti on 5/25/20.
//  Copyright © 2020 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // Replace default UIViewController() with AppsearchController()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewControllers = [
            
            createNavController(viewController: AppPageController(), title: "Explore", imageName: "apps"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),


        ]
        
    }
    
    // Wrap Navigation Controller with a view controller
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        UITabBar.appearance().tintColor = UIColor(red: 228/255, green: 17/255, blue: 17/255, alpha: 1)

        navController.navigationBar.prefersLargeTitles = true
        
        return navController
        
    }
    
}
