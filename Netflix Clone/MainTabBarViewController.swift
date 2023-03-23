//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Boy from Nowhere on 22/03/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        //init controllers
        let homeController = UINavigationController(rootViewController: HomeViewController())
        let upcomingController = UINavigationController(rootViewController: UpcomingViewController())
        let searchController = UINavigationController(rootViewController: SearchViewController())
        let downloadsController = UINavigationController(rootViewController: DownloadsViewController())
        
        //set tabbar icon
        homeController.tabBarItem.image = UIImage(systemName: "house")
        upcomingController.tabBarItem.image = UIImage(systemName: "play.circle")
        searchController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadsController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        //set tabbar title
        homeController.title = "Home"
        upcomingController.title = "Coming soon"
        searchController.title = "Search"
        downloadsController.title = "Downloads"
    
        //set tabbar tincolor
        tabBar.tintColor = .label
        
        //create screen
        setViewControllers([homeController,upcomingController,searchController,downloadsController], animated: true)
    }


}

