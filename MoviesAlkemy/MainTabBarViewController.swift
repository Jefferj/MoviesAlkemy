//
//  MainTabBarViewController.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 30/08/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: MovieListViewController())
        let vc2 = UINavigationController(rootViewController: FavoritesViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "star")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.title = "Home"
        vc2.title = "Favorites"
        vc3.title = "Top Search"
        
        tabBar.tintColor = .label
        tabBar.barTintColor = .white
            
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        

       
    }
    

   

}
