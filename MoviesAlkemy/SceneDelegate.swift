//
//  SceneDelegate.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 29/08/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        let mainViewController = MovieListViewController()
        window = UIWindow(windowScene: windowsScene)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }

   

}

